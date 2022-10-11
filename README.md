# custom-zsh
A repo to contain my setup scripts for linux environments

Easy install:
```bash
curl -fsSL https://raw.githubusercontent.com/zaptross/custom-zsh/main/install.sh | sh
```

### Installed program list
* [Brave Browser](https://brave.com/linux/)
* [curl](https://curl.se/)
* [vim](https://www.vim.org/)
* [vim Gnome Toolkit 3](https://packages.debian.org/stretch/vim-gtk3)
* [git](https://git-scm.com/)
* [xsel](https://linux.die.net/man/1/xsel)
* [tmux](https://github.com/tmux/tmux/wiki)
* [flameshot](https://flameshot.org/#download)
* [oh-my-zsh](https://ohmyz.sh/)

### Configurations
* Sets vim as both `EDITOR` and `VISUAL`
* Requires user input to set up github SSH key for git
* Links `.vimrc` as vim's config file with hardlink
* Links `.tmux.conf` as tmux's config file with hardlink
* Sources `oh-my-customisation.zsh` into zsh
* Sources `oh-my-local.zsh` (untracked) into zsh

