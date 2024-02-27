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

## Powerlevel10k
Powerlevel10k should also be installed automatically. If not, continue

1. CLone the repo
```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

2. set the theme in ~.zshrc
```
ZSH_THEME="powerlevel10k/powerlevel10k"
```

## Install Fonts
1. Download the following fonts
    * [MesloLGS NF Regular.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf)
    * [MesloLGS NF Bold.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf)
    * [MesloLGS NF Italic.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf)
    * [MesloLGS NF Bold Italic.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf)

2. Either click on the fonts, or install them to `/usr/share/fonts/MesloLGS/`
3. Set your terminal font to MesloLGS. This should automatically happen in alacritty.


## Neovim
### Install Neovim 0.9
1. Install through pacman package manager
```bash
sudo pacman -S neovim
```

2. Verify Neovim version
The Arch repos may install a newer version, as of now, this config is only tested with Neovim 0.9. Check your version with the following:
```bash
nvim --version
```

If you do not have Neovim 0.9, you must build and install the binary from source:
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

