# To transfer to new computer:

`git clone https://github.com/Daggerpov/dotfiles.git ~/dotfiles && cd ~/dotfiles`

## Symlinks

`ln -sf ~/dotfiles/.zshrc ~/.zshrc && ln -sf ~/dotfiles/.p10k.zsh ~/.p10k.zsh && ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf && ln -sf ~/dotfiles/.config/nvim ~/.config/nvim && ln -sf ~/dotfiles/.claude/themes ~/.claude/themes && ln -sf ~/dotfiles/.claude/settings.json ~/.claude/settings.json && ln -sf ~/dotfiles/.claude/settings.local.json ~/.claude/settings.local.json && ln -sf ~/dotfiles/.claude/statusline-command.sh ~/.claude/statusline-command.sh`

## Installations:

### Homebrew

On mac it's trivial; on Amazon Linux, these commands are required:
```
sudo yum groupinstall 'Development Tools'
sudo yum install curl file git
sudo yum install libxcrypt-compat
```
`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`


`brew install tmux lazygit zsh neovim git pyenv`
