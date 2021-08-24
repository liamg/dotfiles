alias vim=nvim

__custom__load_session () {
	nvim . +"SLoad! $1"
}

__custom__create_session () {
	nvim . +"SSave $1"
}

e () {
	z $1 || return
	session=$(basename `pwd`)
	[[ -f ~/.local/share/nvim/session/$session ]] && __custom__load_session $session && return
	__custom__create_session $session
}

alias bat=batcat
alias spotify="ncspot"

