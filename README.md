# dotfiles

## setup

- DE                  : Hyprland
- top panel           : waybar
- shell               : zsh
- terminal emulator   : kitty
- menus               : rofi

## applying dotfiles

```sh
 stow -R -v -t ~ .
#      |  |  |- target is home dir
#      |  |- verbose output
#      |- remove link if exist and create new (original files would not be deleted)
```

## requirements

### zsh deps

- [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
- [powerlevel10k](https://github.com/romkatv/powerlevel10k)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [zsh-256color](https://github.com/chrissicool/zsh-256color)

### waybar

- [wlogout](https://github.com/ArtsyMacaw/wlogout)

### additional

- [pokemon-colorscripts](https://gitlab.com/phoneybadger/pokemon-colorscripts)
