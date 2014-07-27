##000 - Off
##111 - White
##100 - Green
##010 - Red
##001 - Blue
##110 - Yellow
##011 - Purple
##101 - Aqua
if [ "$#" -ne 2 ]; then
    echo "<location> <color>"
    echo "locations: left, right, middle or all"
    echo "colors: white, green, red, blue, yellow, purple, aqua or off"
fi

case "$2" in
"off")
    KEYBOARD_COLOR=000
    ;;
"white")
    KEYBOARD_COLOR=111
    ;;
"green")
    KEYBOARD_COLOR=100
    ;;
"red")
    KEYBOARD_COLOR=010
    ;;
"blue")
    KEYBOARD_COLOR=001
    ;;
"yellow")
    KEYBOARD_COLOR=110
    ;;
"purple")
    KEYBOARD_COLOR=011
    ;;
"aqua")
    KEYBOARD_COLOR=101
    ;;
*)
    KEYBOARD_COLOR=000
    ;;
esac


case "$1" in
"all")
    sudo su -c "echo $KEYBOARD_COLOR > /sys/devices/platform/clevo_wmi/kbled/left"
    sudo su -c "echo $KEYBOARD_COLOR > /sys/devices/platform/clevo_wmi/kbled/middle"
    sudo su -c "echo $KEYBOARD_COLOR > /sys/devices/platform/clevo_wmi/kbled/right"
    ;;
"left")
    sudo su -c "echo $KEYBOARD_COLOR > /sys/devices/platform/clevo_wmi/kbled/$1"
    ;;
"middle")
    sudo su -c "echo $KEYBOARD_COLOR > /sys/devices/platform/clevo_wmi/kbled/$1"
    ;;
"right")
    sudo su -c "echo $KEYBOARD_COLOR > /sys/devices/platform/clevo_wmi/kbled/$1"
    ;;
*)
    echo "<location> <color>"
    echo "locations: left, right, middle or all"
    echo "colors: white, green, red, blue, yellow, purple, aqua or off"
esac
