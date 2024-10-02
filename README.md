<h1 align="center">🌿 dotfiles</h1>

Welcome devs! Here you'll find all the configuration files that power my development environment, meticulously curated to provide an efficient, productive, and aesthetically pleasing setup.


## 🌸 Core CLI Info

> [!Note]
> Some of this apps have the config files included in the repo, which are marked with ⚙️. Also, my favorite are programs and tools are marked with 💖.


| 📚 Entry                           | ✨ App                  |
|------------------------------------|--------------------------|
| **Shell**                              | 💖 [zsh](https://zsh.sourceforge.io/) [⚙️](https://github.com/ashish0kumar/dotfiles/blob/master/.zshrc) |
| **Terminal Emulator**                  | [windows terminal](https://github.com/microsoft/terminal) [⚙️](https://github.com/ashish0kumar/windots/blob/main/terminal/settings.json) |
| **Terminal Multiplexer**               | 💖 [tmux](https://github.com/tmux/tmux) [⚙️](https://github.com/ashish0kumar/dotfiles/blob/master/.config/tmux/tmux.conf) |
| **Shell Prompt**                       | [powerlevel10k](https://github.com/romkatv/powerlevel10k) |
| **Text Editor**                        | 💖 [neovim](https://neovim.io/) [⚙️](https://github.com/ashish0kumar/dotfiles/tree/master/.config/nvim) |
| **LS Replacement**                     | [eza](https://github.com/eza-community/eza) |
| **File Manager**                       | 💖 [nnn](https://github.com/jarun/nnn) |
| **Fuzzy File Finder**                  | 💖 [fzf](https://github.com/junegunn/fzf) |
| **Git TUI**                            | [lazygit](https://github.com/jesseduffield/lazygit) |
| **System Monitor**                     | [btop](https://github.com/aristocratos/btop) [⚙️](https://github.com/ashish0kumar/dotfiles/blob/master/.config/btop/btop.conf) |
| **System Fetch**                       | [fastfetch](https://github.com/fastfetch-cli/fastfetch) [⚙️](https://github.com/ashish0kumar/dotfiles/blob/master/.config/fastfetch/config.jsonc) |

<hr/>

## 🔧 Setup

> [!NOTE]
> I’m using WSL2 for my development environment. <br/>
> If you encounter any issues related to file permissions, symbolic links, or path configurations, please keep in mind that WSL2 may behave differently compared to a native Linux environment. You might need to adjust certain configurations accordingly.

1. **Clone the repository**:
    ```bash
    git clone https://github.com/ashish0kumar/dotfiles.git
    cd dotfiles
    ```

2. **Install GNU Stow**:
    - On Ubuntu/Debian: `sudo apt install stow`
    - On macOS: `brew install stow`

3. **Symlink the configurations**:
    ```bash
    stow .
    ```


## 🔗 Stow Guide
GNU Stow is used to manage symlinks for these configuration files. Each subdirectory of the repo contains the dotfiles for a specific application, and Stow handles linking these to your home directory. 

- To symlink a config:
  ```bash
  stow <folder>
  ```

- To remove a symlinked config:

  ```bash
  stow -D <folder>
  ```

<hr/>

## 📜 License

Feel free to use and modify these dotfiles to suit your needs.


<p align="center">
	<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/footers/gray0_ctp_on_line.svg?sanitize=true" />
</p>
