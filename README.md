# Dotfiles

My Dotfiles

## Install

```bash
curl -s https://raw.githubusercontent.com/brandonvfx/dotfiles/master/install | sh
```

## Install oh-my-zsh

``bash
# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

