# Dotfiles

## Requirements
- Nerd Font
- Alacritty >= 0.13.0
- tmux >= 3.3
- zsh >= 5.9
- Neovim >= 0.9.1
- lf >= 30
- yabai >= 6.0.2
- skhd >= 0.3.9

## Installation

### zsh

```shell
ln -s ~/.config/dotfiles/zsh/eojysele.zsh-theme ~/.oh-my-zsh/custom/themes/eojysele.zsh-theme
ln -s ~/.config/dotfiles/zsh/zshrc ~/.zshrc
```

### tmux

```shell
ln -s ~/.config/dotfiles/tmux/tmux.conf ~/.tmux.conf
```

### [neovim](/nvim/README.md)

```shell
ln -s ~/.config/dotfiles/nvim ~/.config/nvim
```

### alacritty

#### General

```shell
ln -s ~/.config/dotfiles/alacritty/toml/alacritty.toml ~/.config/alacritty/alacritty.toml
ln -s ~/.config/dotfiles/alacritty/toml/colors.toml ~/.config/alacritty/colors.toml
```

#### macOS

```shell
ln -s ~/.config/dotfiles/alacritty/toml/macos.toml ~/.config/alacritty/os.toml
```

#### linux

```shell
ln -s ~/.config/dotfiles/alacritty/toml/linux.toml ~/.config/alacritty/os.toml
```

### lf

```shell
ln -s ~/.config/dotfiles/lf ~/.config/lf
```

### yabai

```shell
ln -s ~/.config/dotfiles/yabai ~/.config/yabai
```

### skhd

```shell
ln -s ~/.config/dotfiles/skhd ~/.config/skhd
```

### lazygit

#### macOS

```shell
ln -s ~/.config/dotfiles/lazygit/config.yml ~/Library/Application\ Support/lazygit/config.yml
```

#### linux

```shell
ln -s ~/.config/dotfiles/lazygit/config.yml ~/.config/lazygit/config.yml
```
