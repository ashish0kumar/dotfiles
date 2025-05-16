# --- Zsh Environment ---

export EDITOR='nvim'
export GIT_EDITOR='nvim'

export PATH="$HOME/.local/bin:$PATH"

# --- Zinit Setup and Plugin Management ---

# Enable Powerlevel10k instant prompt. Must be sourced close to the top.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# Load Zinit Plugins
zinit ice depth=1; zinit light romkatv/powerlevel10k # Powerlevel10k theme

zinit light zsh-users/zsh-syntax-highlighting  # Syntax highlighting
zinit light zsh-users/zsh-completions          # Enhanced completions
zinit light zsh-users/zsh-autosuggestions      # Autosuggestions from history
zinit light Aloxaf/fzf-tab                     # fzf integration for completions

zinit cdreplay -q # Replay Zinit commands

# --- Completions ---

autoload -Uz compinit

# Completion styling and behavior
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'             # Case-insensitive
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"            # Use LS_COLORS
zstyle ':completion:*' menu no                                     # No default menu
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath' # fzf-tab preview
zstyle ':completion:*' dumpfile ~/.cache/zsh/.zcompdump            # Cache file

compinit # Initialize completions

# --- Prompt Configuration ---

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# Must be sourced AFTER the powerlevel10k plugin is loaded.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# --- History Settings ---

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# --- Keybindings ---

bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# --- Aliases ---

alias vim='nvim'
alias c='clear'

# exa aliases
alias ls='eza --group-directories-first --icons'
alias la='eza -a --group-directories-first --icons'
alias l='eza -l --group-directories-first --icons'
alias ll='eza -la --group-directories-first --icons'

# bat aliases
alias bat='batcat'
alias fbat="fzf --preview 'batcat --style=numbers --color=always --line-range :500 {}'"

# git aliases
alias gs="git status --short"
alias gd="git diff --output-indicator-new=' ' --output-indicator-old=' '"

alias ga="git add"
alias gap="git add --patch"

alias gc="git commit"
alias gp="git push"
alias gu="git pull"

alias gl="git log --all --graph --pretty=format:'%C(magenta)%h %C(white) %an %ar%C(auto) %D%n%s%n'"

alias gb="git branch"
alias gba="git branch -a"
alias gn="git checkout -b"

alias gi="git init"
alias gcl="git clone"

# --- Tool Specific Configurations ---

# FNM
FNM_PATH="/home/ashish/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/ashish/.local/share/fnm:$PATH"
  eval "`fnm env`"
  eval "$(fnm env --use-on-cd)" # Use on directory change
fi

# Keychain
eval $(keychain --eval --agents ssh id_ed25519 2>/dev/null)

# Bun
[ -s "/home/ashish/.bun/_bun" ] && source "/home/ashish/.bun/_bun" # Bun completions
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# PNPM
export PNPM_HOME="/home/ashish/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Go
export PATH="$PATH:/usr/local/go/bin"
export GOPATH="$HOME/.local/go"
export PATH="$GOPATH/bin:$PATH"

# Zoxide
export _ZO_ECHO='1' # Echo directory on cd
eval "$(zoxide init --cmd cd zsh)"

# Bat-man (Integrate bat with man pages)
export MANPAGER="sh -c 'col -bx | batcat -l man -p'"

# FZF
# Set options BEFORE sourcing the keybindings script
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi \
--preview-window=right:70%"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh # Source keybindings and completions