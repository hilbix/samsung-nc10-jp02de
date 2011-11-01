#!/bin/bash

getbat()
{
/usr/bin/gawk -F= '
	{ v[$1]=$2 }
function s(x)
{
  return v[x]
}
function n(x)
{
  return v[x]/1000000
}
function div(x,y)
{
  if (y==0)
    return 0;
  return x/y;
}
function hm(x)
{
return sprintf("%d:%02d", int(x), int((x-int(x))*60))
}
END	{
	printf("\n%s %3d%% %s/%s=%s %-10s %.3fV (min %.3f) %.3fAh (max %.3f-%.3f) A=%.3f %s" \
		, strftime("%Y%m%d-%H%M%S")	\
		, div(n("POWER_SUPPLY_CHARGE_NOW") * 100, n("POWER_SUPPLY_CHARGE_FULL"))	\
		, s("POWER_SUPPLY_NAME")	\
		, s("POWER_SUPPLY_TECHNOLOGY")	\
		, s("POWER_SUPPLY_PRESENT")	\
		, s("POWER_SUPPLY_STATUS")	\
		, n("POWER_SUPPLY_VOLTAGE_NOW")	\
		, n("POWER_SUPPLY_VOLTAGE_MIN_DESIGN")	\
		, n("POWER_SUPPLY_CHARGE_NOW")	\
		, n("POWER_SUPPLY_CHARGE_FULL"), n("POWER_SUPPLY_CHARGE_FULL_DESIGN")	\
		, n("POWER_SUPPLY_CURRENT_NOW")	\
		, hm(div(n("POWER_SUPPLY_CHARGE_NOW"), n("POWER_SUPPLY_CURRENT_NOW")))	\
	)
	}
' /sys/class/power_supply/BAT1/uevent
}

while	getbat
do
	read -ru3 -t59 || sleep 1
done 3< <(/usr/local/bin/udevraw -a change -f power_supply )

