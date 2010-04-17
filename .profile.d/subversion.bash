alias st='svn st | sort'

alias stp='find . -name \*.csproj | xargs svn diff | tr -d \\r | vim -R -'	#estado de los archivos .csproj

#alias di='svn diff | tr -d \\r > archivoTemporalDeDiff && (vim archivoTemporalDeDiff; rm archivoTemporalDeDiff)'
alias di='svn diff | tr -d \\r | vim -R -c "set syntax=diff" -'
alias vdi='svn diff --diff-cmd svnvimdiff'
alias wdi='svn diff --diff-cmd svnwinmerge'

alias ci='svn ci --username $SVNUSER'

alias logv='svn log -v `svn info | sed -n 2p | sed "s/^URL: \(.*\)/\1/"` | vimsvnlog -R -'
alias log='svn log `svn info | sed -n 2p | sed "s/^URL: \(.*\)/\1/"` | vimsvnlog -R -'

#TODO: documentar que mierda hace esto
function dil() 
{ 
	[[ $# -gt 0 ]] || return

	ARCHIVO="$1"
	for i in `svn log --stop-on-copy "$ARCHIVO" | grep ^r | interpretar 'r $n $resto' '$n' | tac`; do
		svn diff "$ARCHIVO" -c $i | vim - -O -c 'set syntax=diff'
	done
}

