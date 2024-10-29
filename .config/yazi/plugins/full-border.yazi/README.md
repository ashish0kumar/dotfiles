# full-border.yazi

Add a full border to Yazi to make it look fancier.

![full-border](https://github.com/yazi-rs/plugins/assets/17523360/ef81b560-2465-4d36-abf2-5d21dcb7b987)

## Installation

```sh
ya pack -a yazi-rs/plugins:full-border
```

## Usage

Add this to your `init.lua` to enable the plugin:

```lua
require("full-border"):setup()
```

Or you can customize the border type:

```lua
require("full-border"):setup {
	-- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
	type = ui.Border.ROUNDED,
}
```

## License

This plugin is MIT-licensed. For more information check the [LICENSE](LICENSE) file.
