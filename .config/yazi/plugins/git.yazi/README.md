# git.yazi

> [!NOTE]
> Yazi v0.3.3 or later is required for this plugin to work.

Show the status of Git file changes as linemode in the file list.

https://github.com/user-attachments/assets/34976be9-a871-4ffe-9d5a-c4cdd0bf4576

## Installation

```sh
ya pack -a yazi-rs/plugins:git
```

## Setup

Add the following to your `~/.config/yazi/init.lua`:

```lua
require("git"):setup()
```

And register it as fetchers in your `~/.config/yazi/yazi.toml`:

```toml
[[plugin.prepend_fetchers]]
id   = "git"
name = "*"
run  = "git"

[[plugin.prepend_fetchers]]
id   = "git"
name = "*/"
run  = "git"
```

## Advanced

> [!NOTE]
> This section currently requires Yazi nightly that includes https://github.com/sxyazi/yazi/pull/1637

You can customize the [Style](https://yazi-rs.github.io/docs/plugins/layout#style) of the status sign with:

- `THEME.git.modified`
- `THEME.git.added`
- `THEME.git.untracked`
- `THEME.git.ignored`
- `THEME.git.deleted`
- `THEME.git.updated`

For example:

```lua
-- ~/.config/yazi/init.lua
THEME.git = THEME.git or {}
THEME.git.modified = ui.Style():fg("blue")
THEME.git.deleted = ui.Style():fg("red"):bold()
```

You can also customize the text of the status sign with:

- `THEME.git.modified_sign`
- `THEME.git.added_sign`
- `THEME.git.untracked_sign`
- `THEME.git.ignored_sign`
- `THEME.git.deleted_sign`
- `THEME.git.updated_sign`

For example:

```lua
-- ~/.config/yazi/init.lua
THEME.git = THEME.git or {}
THEME.git.modified_sign = "M"
THEME.git.deleted_sign = "D"
```

## License

This plugin is MIT-licensed. For more information check the [LICENSE](LICENSE) file.
