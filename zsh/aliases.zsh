alias vim=nvim

e () {
	(z $1 && nvim . +NvimTreeOpen) || echo "Could not find $1."
}

