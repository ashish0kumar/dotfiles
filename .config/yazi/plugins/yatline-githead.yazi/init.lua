local function setup(_, options)
  options = options or {}

  local config = {
    show_branch = options.show_branch == nil and true or options.show_branch,
    branch_prefix = options.branch_prefix or "on",
    branch_symbol = options.branch_symbol or "",
    branch_borders = options.branch_borders or "()",

    commit_symbol = options.commit_symbol or "@",

    show_behind_ahead = options.behind_ahead == nil and true or options.behind_ahead,
    behind_symbol = options.behind_symbol or "⇣",
    ahead_symbol = options.ahead_symbol or "⇡",

    show_stashes = options.show_stashes == nil and true or options.show_stashes,
    stashes_symbol = options.stashes_symbol or "$",

    show_state = options.show_state == nil and true or options.show_state,
    show_state_prefix = options.show_state_prefix == nil and true or options.show_state_prefix,
    state_symbol = options.state_symbol or "~",

    show_staged = options.show_staged == nil and true or options.show_staged,
    staged_symbol = options.staged_symbol or "+",

    show_unstaged = options.show_unstaged == nil and true or options.show_unstaged,
    unstaged_symbol = options.unstaged_symbol or "!",

    show_untracked = options.show_untracked == nil and true or options.show_untracked,
    untracked_symbol = options.untracked_symbol or "?",
  }

  if options.theme then
    options = options.theme
  end

  local theme = {
    prefix_color = options.prefix_color or "white",
    branch_color = options.branch_color or "blue",
    commit_color = options.commit_color or "bright magenta",
    behind_color = options.behind_color or "bright magenta",
    ahead_color = options.ahead_color or "bright magenta",
    stashes_color = options.stashes_color or "bright magenta",
    state_color = options.state_color or "red",
    staged_color = options.staged_color or "bright yellow",
    unstaged_color = options.unstaged_color or "bright yellow",
    untracked_color = options.untracked_color or "bright blue",
  }


  local get_status = ya.sync(function()
    -- Instead of LANGUAGE, you can try LANG, LC_ALL. If the plugin does not show up.
    local handle = io.popen("LANGUAGE=en_US.UTF-8 git status --ignore-submodules=dirty --branch --show-stash --ahead-behind 2>/dev/null")
    local status = handle:read("*a")
    handle:close()

    return status
  end)

  local function get_branch(status)
    local branch = status:match("On branch (%S+)")

    if branch == nil then
      local commit = status:match("onto (%S+)") or status:match("detached at (%S+)")

      if commit == nil then
        return ""
      else
        local branch_prefix = config.branch_prefix == "" and " " or " " .. config.branch_prefix .. " "
        local commit_prefix = config.commit_symbol == "" and "" or config.commit_symbol

        return { "commit", branch_prefix .. commit_prefix, commit }
      end
    else
      local left_border = config.branch_borders:sub(1, 1)
      local right_border = config.branch_borders:sub(2, 2)

      local branch_string = ""

      if config.branch_symbol == "" then
        branch_string = left_border .. branch .. right_border
      else
        branch_string = left_border .. config.branch_symbol .. " " .. branch .. right_border
      end

      local branch_prefix = config.branch_prefix == "" and " " or " " .. config.branch_prefix .. " "

      return { "branch", branch_prefix, branch_string }
    end
  end

  local function get_behind_ahead(status)
    local diverged_ahead, diverged_behind = status:match("have (%d+) and (%d+) different")
    if diverged_ahead and diverged_behind then
      return { " " .. config.behind_symbol .. diverged_behind, config.ahead_symbol .. diverged_ahead }
    else
      local behind = status:match("behind %S+ by (%d+) commit")
      local ahead = status:match("ahead of %S+ by (%d+) commit")
      if ahead then
        return { "", " " .. config.ahead_symbol .. ahead }
      elseif behind then
        return { " " .. config.behind_symbol .. behind , "" }
      else
        return ""
      end
    end
  end

  local function get_stashes(status)
    local stashes = tonumber(status:match("Your stash currently has (%S+)"))

    return stashes ~= nil and " " .. config.stashes_symbol .. stashes or ""
  end

  local function get_state(status)
    local result = status:match("Unmerged paths:%s*(.-)%s*\n\n")
    if result then
      local filtered_result = result:gsub("^[%s]*%b()[%s]*", ""):gsub("^[%s]*%b()[%s]*", "")

      local unmerged = 0
      for line in filtered_result:gmatch("[^\r\n]+") do
        if line:match("%S") then
          unmerged = unmerged + 1
        end
      end

      local state_name = ""

      if config.show_state_prefix then
        if status:find("git merge") then
          state_name = "merge "
        elseif status:find("git cherry%-pick") then
          state_name = "cherry "
        elseif status:find("git rebase") then
          state_name = "rebase "

          if status:find("done") then
            local done = status:match("%((%d+) com.- done%)") or ""
            state_name = state_name .. done .. "/" .. unmerged .. " "
          end
        else
          state_name = ""
        end
      end

      return " " .. state_name .. config.state_symbol .. unmerged
    else
      return ""
    end
  end

  local function get_staged(status)
    local result = status:match("Changes to be committed:%s*(.-)%s*\n\n")
    if result then
      local filtered_result = result:gsub("^[%s]*%b()[%s]*", "")

      local staged = 0
      for line in filtered_result:gmatch("[^\r\n]+") do
        if line:match("%S") then
          staged = staged + 1
        end
      end

      return " " .. config.staged_symbol .. staged
    else
      return ""
    end
  end

  local function get_unstaged(status)
    local result = status:match("Changes not staged for commit:%s*(.-)%s*\n\n")
    if result then
      local filtered_result = result:gsub("^[%s]*%b()[\r\n]*", ""):gsub("^[%s]*%b()[\r\n]*", "")

      local unstaged = 0
      for line in filtered_result:gmatch("[^\r\n]+") do
        if line:match("%S") then
          unstaged = unstaged + 1
        end
      end

      return " " .. config.unstaged_symbol .. unstaged
    else
      return ""
    end
  end

  local function get_untracked(status)
    local result = status:match("Untracked files:%s*(.-)%s*\n\n")
    if result then
      local filtered_result = result:gsub("^[%s]*%b()[\r\n]*", "")

      local untracked = 0
      for line in filtered_result:gmatch("[^\r\n]+") do
        if line:match("%S") then
          untracked = untracked + 1
        end
      end

      return " " .. config.untracked_symbol .. untracked
    else
      return ""
    end
  end

  function Header:githead()
    local status = get_status()
    local branch_array = get_branch(status)
    local prefix = ui.Span(config.show_branch and branch_array[2] or ""):fg(theme.prefix_color)
    local branch = ui.Span(config.show_branch and branch_array[3] or ""):fg(branch_array[1] == "commit" and theme.commit_color or theme.branch_color)
    local behind_ahead = get_behind_ahead(status)
    local behind = ui.Span(config.show_behind_ahead and behind_ahead[1] or ""):fg(theme.behind_color)
    local ahead = ui.Span(config.show_behind_ahead and behind_ahead[2] or ""):fg(theme.ahead_color)
    local stashes = ui.Span(config.show_stashes and get_stashes(status) or ""):fg(theme.stashes_color)
    local state = ui.Span(config.show_state and get_state(status) or ""):fg(theme.state_color)
    local staged = ui.Span(config.show_staged and get_staged(status) or ""):fg(theme.staged_color)
    local unstaged = ui.Span(config.show_unstaged and get_unstaged(status) or ""):fg(theme.unstaged_color)
    local untracked = ui.Span(config.show_untracked and get_untracked(status) or ""):fg(theme.untracked_color)

    return ui.Line { prefix, branch, behind, ahead, stashes, state, staged, unstaged, untracked }
  end

  Header:children_add(Header.githead, 2000, Header.LEFT)

  if Yatline ~= nil then
    function Yatline.coloreds.get:githead()
      local status = get_status()
      local githead = {}

      local branch = config.show_branch and get_branch(status) or ""
      if branch ~= nil and branch ~= "" then
        table.insert(githead, { branch[2], theme.prefix_color })
	if branch[1] == "commit" then
          table.insert(githead, { branch[3], theme.commit_color })
	else
          table.insert(githead, { branch[3], theme.branch_color })
	end
      end

      local behind_ahead = config.show_behind_ahead and get_behind_ahead(status) or ""
      if behind_ahead ~= nil and behind_ahead ~= "" then
        if behind_ahead[1] ~= nil and behind_ahead[1] ~= "" then
          table.insert(githead, { behind_ahead[1], theme.behind_color })
        elseif behind_ahead[2] ~= nil and behind_ahead[2] ~= "" then
          table.insert(githead, { behind_ahead[2], theme.ahead_color })
        end
      end

      local stashes = config.show_stashes and get_stashes(status) or ""
      if stashes ~= nil and stashes ~= "" then
        table.insert(githead, { stashes, theme.stashes_color })
      end

      local state = config.show_state and get_state(status) or ""
      if state ~= nil and state ~= "" then
        table.insert(githead, { state, theme.state_color })
      end

      local staged = config.show_staged and get_staged(status) or ""
      if staged ~= nil and staged ~= "" then
        table.insert(githead, { staged, theme.staged_color })
      end

      local unstaged = config.show_unstaged and get_unstaged(status) or ""
      if unstaged ~= nil and unstaged ~= "" then
        table.insert(githead, { unstaged, theme.unstaged_color })
      end

      local untracked = config.show_untracked and get_untracked(status) or ""
      if untracked ~= nil and untracked ~= "" then
        table.insert(githead, { untracked, theme.untracked_color })
      end

      if #githead == 0 then
        return ""
      else
        table.insert(githead, {" ", theme.prefix_color})
        return githead
      end
    end
  end
end

return { setup = setup }
