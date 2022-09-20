# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $ZDOTDIR/zsh-functions

install "zsh-users" "zsh-autosuggestions"
install "zsh-users" "zsh-syntax-highlighting"
#install "agkozak" "zsh-z"

add aliases
add completion
add prompt
#add fzf
add exports
#add vim
#add conda



alias luamake=/home/carlo/lua-language-server/3rd/luamake/luamake

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/zsh/.config/zsh/.p10k.zsh.
[[ ! -f ~/.dotfiles/zsh/.config/zsh/.p10k.zsh ]] || source ~/.dotfiles/zsh/.config/zsh/.p10k.zsh
