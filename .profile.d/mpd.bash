export MPD_HOST='nieve'

alias musica='ncmpc -c'

function mpc_pausarDespuesDeEsta() {
	remanenteDeCancionActual=`mpc | awk -F"[ /:]" '/playing/ {print 60*($8-$6)+$9-$7}'`

	[[ $remanenteDeCancionActual ]] && {
			sleep $remanenteDeCancionActual
			mpc pause
	} &
}

