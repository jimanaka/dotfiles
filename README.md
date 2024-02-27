# Dotfiles
Portable configuration files for standing up new machines. Mainly for Arch Linux, but I may add instructions for other distros, idk.

## Index
* [Dependencies](#dependencies)
* [Zsh](#zsh)
* [Powerlevel10k](#powerlevel10k)
* [Install Fonts](#install-fonts)
* [Neovim](#neovim)

## Dependencies
* [Zsh](#zsh)
* [Brew (MacOS only)](#brew)
* [Oh My Zsh](#oh-my-zsh)
* [Powerlevel10k](#powerlevel10k)
* [Nerd Fonts](#nerd-fonts)
### Zsh
1. Install Zsh

#### Fedora
```bash
sudo dnf install zsh
```
#### Arch Linux
```bash
sudo pacman -S zsh
```
oh-my-zsh should be automatically installed. If it isn't, continue 

2. Download oh-my-zsh
```bash
wget --no-check-certificate http://install.ohmyz.sh -O - | sh
```

### Brew
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
```bash
eval "$(/opt/homebrew/bin/brew shellenv)"
```

### Oh-my-zsh
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Powerlevel10k
```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```
the theme should automatically apply if you follow the install guide

### Nerd Fonts 
1. Download the JetbrainsMono Nerd Font (here)[https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip]
2. Either click on the fonts, or install them to `/usr/share/fonts/JetbrainsMonoNF/`
3. Set your terminal font to JetbrainsMonoNFM. This should automatically happen if you follow the install guide.


### Neovim
#### Fedora
```bash
sudo dnf install neovim
```

#### MacOS
```bash
brew install neovim
```

### Arch Linux
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

### Install Other Required Packages
There might be more than this, I'm just adding the documentation as I go
```bash
sudo pacman -S xsel zathura zathura-pdf-mupdf xdotool biber clangd ripgrep python texlive-most texlive-lang texlive-bibtexextra
```

### Python Support
1. Install python
```bash
sudo pacman -S python
```

2. Install pynvim
```bash
pip install pynvim
```

### Node Support
1. Install fnm (Fast Node Manager)
```bash
yay -S fnm
```

or
```bash
curl -fsSL https://fnm.vercel.app/install | bash
```

2. List node versions
```bash
fnm ls-remote
```

3. Install node version (tested with 19.3.0)
```bash
fnm install v19.3.0
```

### Running Neovim
Run neovim to install all the plugins and stuff
```bash
nvim
```

Check the health of neovim
```bash
:checkhealth
```

### Language Servers
