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
