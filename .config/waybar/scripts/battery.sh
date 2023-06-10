battery=$1
capacity=$(cat /sys/class/power_supply/$battery/capacity)
status=$(cat /sys/class/power_supply/$battery/status)

if [[ $status == "Charging" ]]; then
    status="charging"
else
    status="discharging"
fi

class=$status

if [[ $capacity -le 10 ]]; then
    class="$class critical"
elif [[ $capacity -le 20 ]]; then
    class="$class low"
fi

echo "{\"percentage\": $capacity, \"class\": \"$class\", \"alt\": \"$status\"}"
