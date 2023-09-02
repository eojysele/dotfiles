# Dotfiles

## Installation

### zsh

Required: oh-my-zsh.

```shell
ln -s ~/.config/dotfiles/zsh/ej.zsh-theme ~/.oh-my-zsh/custom/themes/ej.zsh-theme

ln -s ~/.config/dotfiles/zsh/zshrc ~/.zshrc
```

### Tmux

```shell
ln -s ~/.config/dotfiles/tmux/tmux.conf ~/.tmux.conf
```

### Neovim

```shell
ln -s ~/.config/dotfiles/nvim ~/.config/nvim
```

### Alacritty

```shell
# use for macos
ln -s ~/.config/dotfiles/alacritty/macos.yml ~/.config/alacritty/alacritty.yml

# use for linux
ln -s ~/.config/dotfiles/alacritty/linux.yml ~/.config/alacritty/alacritty.yml
```

### kitty

```shell
ln -s ~/.config/dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf

ln -s ~/.config/dotfiles/kitty/colors.conf ~/.config/kitty/colors.conf

# use for macos
ln -s ~/.config/dotfiles/kitty/macos.conf ~/.config/kitty/macos.conf

# use for linux
ln -s ~/.config/dotfiles/kitty/linux.conf ~/.config/kitty/linux.conf
```

## Showcase

1. Alacritty + tmux + neovim

![Alacritty + tmux](docs/resources/images/alacritty.png)

2. kitty

![kitty](docs/resources/images/kitty.png)







