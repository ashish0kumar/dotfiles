# 🐧 dotfiles

Welcome devs! Here you'll find all the configuration files that power my development environment, meticulously curated to provide an efficient, productive, and aesthetically pleasing setup.

## 🛠️ Core
- **Zsh**: `.zshrc`, for custom aliases, functions, and prompt customization.
- **Neovim (NvChad)**: Full configuration for [NvChad](https://nvchad.com/) stored in `.config/nvim`, featuring a plugin-rich environment.
- **Tmux**: `.config/tmux/.tmux.conf`, with key bindings and session management for an efficient terminal workflow.

> [!NOTE]
> I’m using WSL2 for my development environment. If you encounter any issues related to file permissions, symbolic links, or path configurations, please keep in mind that WSL2 may behave differently compared to a native Linux environment. You might need to adjust certain configurations accordingly.


## ⚙️ Installation

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

4. **Install NvChad**:
    If NvChad isn’t already installed, clone the repository:
    ```bash
    git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
    ```

    - Your custom configurations should be placed under `~/.config/nvim/lua/custom/` (for key mappings, options, etc.).
    - NvChad uses [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management.


## 🚀 Usage
After symlinking, the configurations will be applied automatically when you restart your terminal or application. To apply changes, reload or source the files:
- Zsh: `source ~/.zshrc`
- Tmux: `tmux source ~/.tmux.conf`
- NvChad: Restart Neovim or run `:Lazy sync` inside Neovim to sync plugins using **lazy.nvim**.


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


## ⚒️ Additional Tools

Here are some tools I recommend for enhancing your workflow:

- Zsh Plugins: [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting), [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- Tmux Plugin Manager: [TPM](https://github.com/tmux-plugins/tpm)
- NvChad Plugins: Managed with [lazy.nvim](https://github.com/folke/lazy.nvim)

### ✨ For CLI Lovers

These tools won't necessarily boost your productivity, but they'll definitely make your terminal experience more fun and visually appealing! Check out some of the ways you can add a little flair to your command-line setup:

- [nnn](https://github.com/jarun/nnn) - (n3) is a full-featured terminal file manager.
- [nitch](https://github.com/ssleert/nitch) - incredibly fast system fetch written in nim.
- [btop](https://github.com/aristocratos/btop) - a resource monitor for the terminal.
- [cmatrix](https://github.com/abishekvashok/cmatrix) - terminal based "The Matrix" like implementation.
- [cbonsai](https://gitlab.com/jallbrit/cbonsai) - a bonsai tree generator, written in C using ncurses.
- [pipes.sh](https://github.com/pipeseroni/pipes.sh) - Animated pipes terminal screensaver.


## 📜 License

Feel free to use and modify my dotfiles. No guarantees that they’ll work on your system. 😊
