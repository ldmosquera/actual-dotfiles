function acs() {
	PANTALLA=$1
	shift 
	ac "$PANTALLA spawn $@"
}

function ac() {
	PANTALLA=$1
	shift
	awesome-client <<< "$PANTALLA $@"
}

alias varc='vim -p ~/.awesomerc ~/.xsession'

