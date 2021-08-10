#!/bin/ksh
#
# Fetch info about your computer, to send to lemonbar

clock() {
	date '+%d/%m/%Y %H:%M'
}

battery() {
	BATP=$(apm -l)
	BATC=$(apm -a)
	echo -n $BATP
	test $BATC -gt 0 && echo -n '+' || echo -n '-'
}

network() {
	WIFI="iwx0"
	ETH="re0"
}

desktop() {
	DESKTOP_ID=$(xprop -root '\t$0' _NET_CURRENT_DESKTOP | cut -f 2)
	DESKTOP_TOTAL=$(xprop -root '\t$0' _NET_NUMBER_OF_DESKTOPS | cut -f 2)
	line=""
#	if [ 1 -ne $((DESKTOP_ID)) ]
#	then
		for w in `jot $((DESKTOP_TOTAL - 1)) 1 $((DESKTOP_ID - 1)) 1 2>/dev/null`; do line="${line}="; done
		line="${line}|"
		for w in `jot  $((DESKTOP_TOTAL - 1)) $((DESKTOP_ID + 2)) $DESKTOP_TOTAL 1`; do line="${line}="; done
#	else
#		line="|"
#		for w in `jot  $((DESKTOP_TOTAL - 1)) 1 $((DESKTOP_TOTAL - 2)) 1`; do line="${line}="; done
#	fi
	echo $line
}

while :; do
	buf=""
	buf="${buf} [$(desktop)]   --  "
	buf="${buf} %{r}$(battery)"
	buf="${buf} %{c}$(clock)"
	#buf="${buf} NET: $(network) -"
	#buf="${buf} CPU: $(cpuload)%% -"
	#buf="${buf} RAM: $(memused)%% -"
	#buf="${buf} VOL: $(volume)%%"
	#buf="${buf} MPD: $(nowplaying)"

	echo $buf
	# use `nowplaying scroll` to get a scrolling output!
	sleep 1 # The HUD will be updated every second
done
