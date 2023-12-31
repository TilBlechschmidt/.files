#!/usr/bin/env bash

ACPI=$(acpi -b)
#CHARGE=$(echo -n "${ACPI}" | egrep -o "[0-9]+%" | sed -e "s,%,,g")
CHARGE=$(cat /sys/class/power_supply/BAT0/capacity)

STATE=""
if grep -q "Charging\|Full" <(echo "${ACPI}" | awk '{ gsub("Unknown","Charging",$3); print $3}'); then
    STATE=""
else
    STATE=$(echo "${ACPI}" | awk -F' ' '{print $5}' | awk -F':' '{print $1":"$2}')
    STATE=" (${STATE}h)"
fi

LEVEL=$(( (CHARGE - 1) / 20 ))
ICON="f$(( 244 - LEVEL ))"

if [ "$(ls -A /sys/class/power_supply | grep BAT0)" ]; then
	echo -e "  \u${ICON}  ${CHARGE}%${STATE}"
	[[ ${CHARGE} -lt 5 ]] && {
	    [[ -z "${STATE}" ]] || i3-msg "fullscreen disable"
	    exit 33
	}
else
	echo " "
fi

exit 0
