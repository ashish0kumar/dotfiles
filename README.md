# dotfiles

This repo contains the dotfiles for my wsl2 setup

## Requirements

### Git

```
sudo apt install git
```

### Stow

```
sudo apt install stow
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```
git clone git@github.com:ashish0kumar/dotfiles.git
cd
```

then use GNU stow to create symlinks

```
stow .
```
