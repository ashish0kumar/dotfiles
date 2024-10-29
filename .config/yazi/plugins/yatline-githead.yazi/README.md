# yatline-githead.yazi

Manual clone of [githead.yazi](https://github.com/llanosrocas/githead.yazi) for supporting [yatline.yazi](https://github.com/imsi32/yatline.yazi)

> [!IMPORTANT]
> This repository will not add new features other than coming from orginal repository.  
> The latest commit in there is bf150f3ee982e565940c63dc98603d275120ca96.

All supported features are listed [here](#features)

## Requirements

- yazi version >= 0.3.0
- Font with symbol support. For example [Nerd Fonts](https://www.nerdfonts.com/).
- yatline.yazi (Optional)

## Installation

```sh
ya pack -a imsi32/yatline-githead
```

## Usage

Add this to your `~/.config/yazi/init.lua`:

> [!IMPORTANT]
> If you are using yatline.yazi, put this after its initialization.

```lua
require("yatline-githead"):setup()
```

Read more about indicators [here](https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#what-do-different-symbols-in-git-status-mean).

Optionally, configuration:

```lua
require("githead"):setup({
  show_branch = true,
  branch_prefix = "on",
  prefix_color = "white",
  branch_color = "blue",
  branch_symbol = "",
  branch_borders = "()",

  commit_color = "bright magenta",
  commit_symbol = "@",

  show_behind_ahead = true,
  behind_color = "bright magenta",
  behind_symbol = "⇣",
  ahead_color = "bright magenta",
  ahead_symbol = "⇡",

  show_stashes = true,
  stashes_color = "bright magenta",
  stashes_symbol = "$",

  show_state = true,
  show_state_prefix = true,
  state_color = "red",
  state_symbol = "~",

  show_staged = true,
  staged_color = "bright yellow",
  staged_symbol = "+",

  show_unstaged = true,
  unstaged_color = "bright yellow",
  unstaged_symbol = "!",

  show_untracked = true,
  untracked_color = "blue",
  untracked_symbol = "?",
})
```

You can also use a [theme](https://github.com/imsi32/yatline-themes):

```lua
local your_theme = {
  prefix_color = "white",
  branch_color = "blue",
  commit_color = "bright magenta",
  stashes_color = "bright magenta",
  state_color = "red",
  staged_color = "bright yellow",
  unstaged_color = "bright yellow",
  untracked_color = "blue",
}

require("githead"):setup({
-- ===
    
  theme = your_theme,

-- ===
})
```

If you are using yatline.yazi, you can use this component:

``` lua
-- ===

  {type = "coloreds", custom = false, name = "githead"},

-- ===
```

## Features

- [x] Current branch (or current commit if branch is not presented)
- [x] Behind/Ahead of the remote
- [x] Stashes
- [x] States
  - [x] merge
  - [x] cherry
  - [x] rebase (+ done counter)
- [x] Staged
- [x] Unstaged
- [x] Untracked

### Under the hood

The goal is to use minimum amount of shell commands.

```shell
git status --ignore-submodules=dirty --branch --show-stash
```

This command provides information about branches, stashes, staged files, unstaged files, untracked files, and other statistics.

## Credits

- [githead.yazi](https://github.com/llanosrocas/githead.yazi)
- [yazi source code](https://github.com/sxyazi/yazi)
- [powerlevel10k](https://github.com/romkatv/powerlevel10k)
