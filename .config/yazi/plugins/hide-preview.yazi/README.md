# hide-preview.yazi

Switch the preview pane between hidden and shown.

https://github.com/yazi-rs/plugins/assets/17523360/c4f0b5c4-ff9f-4be8-ba73-4d8e7902e383

## Installation

```sh
ya pack -a yazi-rs/plugins:hide-preview
```

## Usage

Add this to your `~/.config/yazi/keymap.toml`:

```toml
[[manager.prepend_keymap]]
on   = "T"
run  = "plugin --sync hide-preview"
desc = "Hide or show preview"
```

Make sure the <kbd>T</kbd> key is not used elsewhere.

## Advanced

In addition to triggering the plugin with a keypress, you can also trigger it in your `init.lua` file:

```lua
if os.getenv("NVIM") then
	require("hide-preview"):entry()
end
```

In the example above, when it detects that you're [using Yazi in nvim](https://yazi-rs.github.io/docs/resources#vim), the
preview is hidden by default - you can always press `T` (or any key you've bound) to display it again.

## License

This plugin is MIT-licensed. For more information check the [LICENSE](LICENSE) file.
