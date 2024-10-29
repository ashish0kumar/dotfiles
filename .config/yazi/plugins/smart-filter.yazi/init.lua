local hovered = ya.sync(function()
	local h = cx.active.current.hovered
	if not h then
		return {}
	end

	return {
		url = h.url,
		is_dir = h.cha.is_dir,
		unique = #cx.active.current.files == 1,
	}
end)

local function prompt()
	return ya.input {
		title = "Smart filter:",
		position = { "center", w = 50 },
		realtime = true,
		debounce = 0.1,
	}
end

local function entry()
	local input = prompt()

	while true do
		local value, event = input:recv()
		if event ~= 1 and event ~= 3 then
			ya.manager_emit("escape", { filter = true })
			break
		end

		ya.manager_emit("filter_do", { value, smart = true })

		local h = hovered()
		if h.unique and h.is_dir then
			ya.manager_emit("escape", { filter = true })
			ya.manager_emit("enter", {})
			input = prompt()
		elseif event == 1 then
			ya.manager_emit("escape", { filter = true })
			ya.manager_emit(h.is_dir and "enter" or "open", { h.url })
		end
	end
end

return { entry = entry }
