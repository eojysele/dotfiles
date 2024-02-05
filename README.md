# Dotfiles

## Requirements
- Alacritty >= 0.12.2
- tmux >= 3.3
- zsh >= 5.9 (also requred oh-my-zsh)
- Neovim >= 0.9.1
- lf >= 30
- yabai >= 6.0.2
- skhd >= 0.3.9

## Installation

1. Install all available configs

```shell
./install --all
```

Install without saving yours old configs.

```shell
./install --all --no-backup
```

2. Install a separate config. Available values: alacritty kitty lf nvim skhd tmux yabai zsh

```shell
./install kitty nvim
```

Install a separate config without saving yours old configs

```shell
./install --no-backup kitty nvim
```

### Manual instalation

#### zsh

```shell
ln -s ~/.config/dotfiles/zsh/eojysele.zsh-theme ~/.oh-my-zsh/custom/themes/eojysele.zsh-theme
ln -s ~/.config/dotfiles/zsh/zshrc ~/.zshrc
```

#### tmux

```shell
ln -s ~/.config/dotfiles/tmux/tmux.conf ~/.tmux.conf
```

#### neovim

```shell
ln -s ~/.config/dotfiles/nvim ~/.config/nvim
```

#### kitty

- General

```shell
ln -s ~/.config/dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -s ~/.config/dotfiles/kitty/colors.conf ~/.config/kitty/colors.conf
```

- macOS

```shell
ln -s ~/.config/dotfiles/kitty/macos.conf ~/.config/kitty/os.conf
ln -s /Applications/kitty.app/Contents/MacOS/kitten ~/.local/bin
```

- linux

``` shell
ln -s ~/.config/dotfiles/kitty/linux.conf ~/.config/kitty/os.conf
```

#### alacritty
##### 1. toml config

- General

```shell
ln -s ~/.config/dotfiles/alacritty/toml/alacritty.toml ~/.config/alacritty/alacritty.toml
ln -s ~/.config/dotfiles/alacritty/toml/colors.toml ~/.config/alacritty/colors.toml
```
- macOS

```shell
ln -s ~/.config/dotfiles/alacritty/toml/macos.toml ~/.config/alacritty/os.toml
```

- linux

```shell
ln -s ~/.config/dotfiles/alacritty/toml/linux.toml ~/.config/alacritty/os.toml
```

##### 2. yaml config (OLD)

- General

```shell
ln -s ~/.config/dotfiles/alacritty/yaml/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -s ~/.config/dotfiles/alacritty/yaml/colors.yml ~/.config/alacritty/colors.yml
```

- macOS

```shell
ln -s ~/.config/dotfiles/alacritty/yaml/macos.yml ~/.config/alacritty/os.yml
```

- linux

```shell
ln -s ~/.config/dotfiles/alacritty/yaml/linux.yml ~/.config/alacritty/os.yml
```

#### lf

```shell
ln -s ~/.config/dotfiles/lf ~/.config/lf
```

#### yabai

```shell
ln -s ~/.config/dotfiles/yabai ~/.config/yabai
```

#### skhd

```shell
ln -s ~/.config/dotfiles/skhd ~/.config/skhd
```
