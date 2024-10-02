<h1 align="center">🌿 dotfiles</h1>

Welcome devs! Here you'll find all the configuration files that power my development environment, meticulously curated to provide an efficient, productive, and aesthetically pleasing setup.


## 🌸 Core CLI Info

> [!Note]
> Some of this apps have the config files included in the repo, which are marked with ⚙️.


| 📚 Entry                           | ✨ App                  |
|------------------------------------|--------------------------|
| Shell                              | zsh ⚙️            	|
| Terminal Emulator                  | windows terminal ⚙️   	|
| Terminal Multiplexer               | tmux ⚙️               	|
| Shell Prompt                       | powerlevel10k       	|
| Text Editor                        | neovim ⚙️          	|
| LS Replacement                     | eza                    	|
| File Manager                       | nnn ⚙️            	|
| Fuzzy File Finder                  | fzf                 	|
| Git TUI                            | lazygit         		|
| System Monitor                     | btop ⚙️               	|
| System Fetch                       | fastfetch ⚙️        	|

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
