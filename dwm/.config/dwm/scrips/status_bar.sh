interval=1
delim="|"

function dte {
	dte="$(date +"%m-%d (%a) %I:%M%p")"
	echo " $dte"
}

function upd {
	upd=`checkupdates | wc -l`
	echo " $upd updates"
}

function mem {
	mem=`free | awk '/Mem/ {printf "%d MiB/%d MiB\n", $3 / 1024.0, $2 / 1024.0}'`
	echo " $mem"
}

function cpu {
	read cpu a b c previdle rest < /proc/stat
	prevtotal=$((a+b+c+previdle))
	sleep 0.5
	read cpu a b c idle rest < /proc/stat
	total=$((a+b+c+idle))
	cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
	echo "  $cpu% cpu"
}

function batery {
    STATUS="$(sed -n '2p' /sys/class/power_supply/BAT?/uevent | sed 's:.*=::')"
    if ([ $STATUS == 'Discharging' ]); then
        sleep 0.5
        for x in /sys/class/power_supply/BAT?/capacity;
            do
                case "$(cat $x)" in
                    100|9[0-9]) echo " $(cat $x)" ;;
                    8[0-9]|7[0-9]) echo "[ $(cat $x)" ;;
                    6[0-9]|5[0-9]) echo " $(cat $x)" ;;
                    4[0-9]|3[0-9]) echo " $(cat $x)" ;;
                *) echo " $(cat $x)" ;;
                esac
            done
    elif ([ $STATUS != 'Dischraging' ]); then
        BAT_PERCENT="$(cat /sys/class/power_supply/BAT0/capacity)"
        echo "c $BAT_PERCENT"
    fi
}

while true; do
	bar="$(cpu) $delim $(mem) $delim $(upd) $delim $(dte) $delim $(batery)"
	xsetroot -name "$bar" | tr '\n' ' '
	sleep interval
done &
