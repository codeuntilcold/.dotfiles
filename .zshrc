export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Edit commands using vi bindings
set -o vi

. "$HOME/.cargo/env"

alias ez='nvim ~/.zshrc'
alias sz='source ~/.zshrc'
alias dot='nvim ~/Dev/personal/dotfiles'

alias lg='lazygit'
alias ldk='lazydocker'
alias tmux='tmux -2'
alias zl='zellij'
alias dbui='nvim -c "DBUI"'
alias vim='nvim'

# fp auto-completion
() {
  local FLATPAK_APPS=$(flatpak list --app | cut -f1 | awk '{print tolower($1)}')
  complete -W $FLATPAK_APPS fp
}

function fp() {
  app=$(flatpak list --app | cut -f2 | awk -v app="$1" '(tolower($NF) ~ tolower(app))')
  test -z $1 && printf "Enter an app to fp.\n\$ fp <app>\n\nINSTALLED APPS\n$app\n" && return;
  shift 1;
  ( flatpak run "$app" "$@" &> /dev/null & )
}

function gigen() {
  curl -sLw n https://www.toptal.com/developers/gitignore/api/$@ ;
}

# For fzf
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

export FZF_DEFAULT_OPTS="--layout=reverse"
export PATH="${PATH}:${HOME}/.local/bin/:${HOME}/.local/scripts:/usr/local/go/bin"

# Automatically create a new session
tmux has-session -t main 2> /dev/null
if [ $? != 0 ]; then
  tmux new-session -d -s main
fi

(cat ~/.cache/wal/sequences &)

eval "$(zoxide init zsh)" 

eval "$(starship init zsh)"

