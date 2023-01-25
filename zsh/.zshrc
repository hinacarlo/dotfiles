export ZDOTDIR=$HOME/.config/zsh
source "$HOME/.config/zsh/.zshrc"

unsetopt SHARE_HISTORY
# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm #bash_completion

#export PATH="~/.npm-packages/bin:$PATH"
#NPM_PACKAGES="${HOME}/.npm-packages"

export PATH="$HOME/.dotfiles/nvim/lua-language-server/bin:$PATH"

#neofetch
