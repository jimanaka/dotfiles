# Dotfiles
Portable configuration files and setup instructions for standing up new machines. Currently, mainly for Fedora.

## Index
* [Dependencies](#dependencies)
* [Installation](#installation)

## Dependencies
* [Alacritty](#alacritty)
* [Zsh](#zsh)
* [Brew (macOS only)](#brew)
* [Nerd Fonts](#nerd-fonts)
* [Oh My Zsh](#oh-my-zsh)
* [Powerlevel10k](#powerlevel10k)
* [Node Support](#node)
* [Neovim](#neovim)
* [NvChad](#nvchad)
* [Other Small Programs](#Misc)

### Alacritty

#### Fedora
```bash
sudo dnf install alacritty
```

### Zsh

#### Fedora
```bash
sudo dnf install zsh
```
#### Arch Linux
```bash
sudo pacman -S zsh
```

### Brew
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
```bash
eval "$(/opt/homebrew/bin/brew shellenv)"
```

### Oh-my-zsh
1. Install oh-my-zsh
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

2. Install relevant plugins
##### zsh-autosuggestions
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

##### zsh-syntax-highlighting
```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

##### history-substring-search
```bash
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
```

### Powerlevel10k
```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```
the theme should automatically apply if you follow the install guide

### Nerd Fonts 
1. Download the JetbrainsMono Nerd Font (here)[https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip]
2. Either click on the fonts, or install them to `/usr/share/fonts/JetbrainsMonoNF/`
3. Set your terminal font to JetbrainsMonoNFM. This should automatically happen if you follow the installation guide. (May need to use JetbrainsMonoNF instead of JetbrainsMonoNFM)


### Neovim
#### Fedora
```bash
sudo dnf install neovim
```

#### MacOS
```bash
brew install neovim
```

#### Arch Linux
```bash
sudo pacman -S neovim
```

If you get errors due to an outdated version of neovim, you must build and install the binary from source:
```bash
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout release-0.9
make CMAKE_BUID_TYPE=Release
sudo make install
```

### Node
1. Install fnm (Fast Node Manager)
```bash
curl -fsSL https://fnm.vercel.app/install | bash
```

2. List node versions
```bash
fnm ls-remote
```

3. Install node version (tested with 20.10.0)
```bash
fnm install 20.10.0
```

### NvChad
1. Install NvChad
```bash
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
```
Go through the setup process. You can select [Y] to use default configurations (it doesn't matter)

2. Remove the ~/.config/nvim/lua/custom/ directory
```bash
rm -rf ~/.config/nvim/lua/custom/
```

### Misc
```bash
sudo dnf install wl-copy ripgrep stow neofetch htop tree vim
```

## Installation
1. clone the repo
```bash
git clone git@github.com:jimanaka/dotfiles.git ~/dotfiles
```
or 
```bash
git clone https://github.com/jimanaka/dotfiles.git ~/dotfiles
```

2. Backup old configuration files
```bash
mv ~/.config/nvim/lua/custom ~/custom.bak && mv ~/.zshrc ~/.zshrc_pre_stow.bak
```

2. In the ~/dotfiles directory, run the stow command
```bash
stow .
```

If you see any errors, it is probably because a file of the same name already exists in the stow location
