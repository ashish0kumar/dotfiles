# smart-filter.yazi

A Yazi plugin that makes filters smarter: continuous filtering, automatically enter unique directory, open file on submitting.

https://github.com/yazi-rs/plugins/assets/17523360/72aaf117-1378-4f7e-93ba-d425a79deac5

## Installation

```sh
ya pack -a yazi-rs/plugins:smart-filter
```

## Usage

Add this to your `~/.config/yazi/keymap.toml`:

```toml
[[manager.prepend_keymap]]
on   = "F"
run  = "plugin smart-filter"
desc = "Smart filter"
```

Make sure the <kbd>F</kbd> key is not used elsewhere.

## License

This plugin is MIT-licensed. For more information check the [LICENSE](LICENSE) file.
