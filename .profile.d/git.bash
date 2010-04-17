alias gb='git branch'
alias gs='git status'
alias gri='git rebase -i'
alias glp='git log --pretty=format:"%h %ai %s"'
alias gg='( gitk --all & pid=$!; disown $pid; git gui & pid=$!; disown $pid )'

#git diff a traves de vim, pasando parametros
function gdi() {
	git diff "$@" | tr -d \\r | vim - -c "set syntax=diff" -R
}

#git log a traves de vim, pasando parametros
function gl() {
	git log "$@" | tr -d \\r | vim -R -
}

#usa vimdiff para ver los cambios sobre un archivo con respecto al ultimo commit
function gvd() {
	vimdiff <(git show HEAD:"$1") "$1"
}

#inicializa un repositorio git y crea un commit inicial con el .gitignore.
function inicializarGit() {
	test -d .git && { echo "Ya existe un directorio .git; abortando" 1>&2; return 1; }
	test -d .gitignore && { echo "Ya existe un archivo .gitignore; abortando" 1>&2; return 1; }

	set -x

	{
		git init &&
			> .gitignore &&
			git add .gitignore &&
			git commit -m 'Inicial.'
	}

	set +x
}

function git_move() (
	IFS=$'\n'

	desde=$1
	hasta=$2

	dirname_desde=`dirname $desde`

	mkdir -p $dirname_desde

	mv $hasta $desde && git mv $desde $hasta

	rmdir -p $dirname_desde &>/dev/null
)

