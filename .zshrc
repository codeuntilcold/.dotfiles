export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git zsh-syntax-highlighting asdf)

source $ZSH/oh-my-zsh.sh

export PATH="${PATH}:${HOME}/.local/bin/:${HOME}/.local/scripts:/usr/local/go/bin:${HOME}/go/bin:/opt/nvim-linux64/bin"

# tex
# export TEXMFHOME=~/.TinyTeX/texmf-dist:~/texmf
alias lmk=latexmk

# Edit commands using vi bindings
set -o vi

export EDITOR=nvim
source "$HOME/.cargo/env"

alias upgrade='sudo apt update && sudo apt upgrade'

alias ez='nvim ~/.zshrc'
alias sz='source ~/.zshrc'
alias dot='nvim ~/Dev/personal/dotfiles'
alias ck='nvim ~/.sdai/cookies'
alias tma='tmux -2 a'

function dailyzoom() {
  xdg-open 'https://app.zoom.us/wc/84023662781/join?pwd=N1U3enJ4T0c3bGQwdWw3N3JEdkxKUT09'
}

alias lg='lazygit'
alias ldk='lazydocker'
alias zl='zellij'
alias dbui='nvim -c "DBUI"'
alias oil='nvim -c "Oil"'

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

alias suibuild='sui move build --doc --skip-fetch-latest-git-deps'
alias suitest='sui move test --doc --skip-fetch-latest-git-deps'

alias batter=' upower -i $(upower -e | head -n1)'

function gigen() {
  curl -sLw n https://www.toptal.com/developers/gitignore/api/$@ ;
}

# For fzf
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

export FZF_DEFAULT_OPTS="--layout=reverse"
export FZF_TMUX_OPTS='-p80%,60%'

# Automatically create a new session
tmux has-session -t main 2> /dev/null || tmux new-session -d -s main

(cat ~/.cache/wal/sequences &)

eval "$(zoxide init zsh)" 

eval "$(starship init zsh)"
