# arch-config
## About this project
This is my Arch Linux configuration.

### Software

> [!WARNING]
> Some of the LSP packages have software requirements (see documentation)

- [Wayland](https://wayland.freedesktop.org/)
- [Hyprland](https://hyprland.org/)
- [swww](https://github.com/LGFae/swww)
- [Hyprshot](https://github.com/Gustash/Hyprshot)
- [Flameshot](https://github.com/flameshot-org/flameshot/releases)
- [Waybar](https://github.com/Alexays/Waybar)
- [wvkbd](https://github.com/jjsullivan5196/wvkbd)
- [Neovim](https://neovim.io/)
    - [lazy.nvim](https://github.com/folke/lazy.nvim)
    - For a list of plugins see `./config/nvim/lua/malik/packer.lua`
- [WezTerm](https://wezfurlong.org/wezterm/)
- [kitty](https://sw.kovidgoyal.net/kitty/)
- [Nemo](https://github.com/linuxmint/nemo)
- [Swaylock-effects](https://github.com/mortie/swaylock-effects)
- [SDDM](https://github.com/sddm/sddm)
    - [Sugar Candy theme](https://github.com/Kangie/sddm-sugar-candy)
- [Oh My Zsh](https://ohmyz.sh/)
    - [Color LS](https://github.com/athityakumar/colorls)
    - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
    - [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
    - [fzf](https://github.com/junegunn/fzf.git)
    - [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
    - [zoxide](https://github.com/ajeetdsouza/zoxide)
- [Rofi](https://github.com/lbonn/rofi)
- [wlogout](https://github.com/ArtsyMacaw/wlogout)

### Fonts
- [JetBrains Mono](https://www.jetbrains.com/lp/mono/)
- [Roboto](https://fonts.google.com/specimen/Roboto)
- [YES24](https://www.yes24.com/campaign/00_corp/2019/0930Yesfont.aspx)
- [Noto Sans SC](https://fonts.google.com/noto/specimen/Noto+Sans+SC)
- [Noto Sans TC](https://fonts.google.com/noto/specimen/Noto+Sans+TC)
- [Cooper Hewitt](https://www.cooperhewitt.org/open-source-at-cooper-hewitt/cooper-hewitt-the-typeface-by-chester-jenkins/)
- [Fira Code Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode)

> [!CAUTION]
> The install script will overwrite any symlinks already present!

To install the configuration files simply run the install script or manually create the symlinks.
