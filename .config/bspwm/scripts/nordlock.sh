#!/bin/bash

if pgrep -x rofi; then
	killall rofi
fi


i3lock -n -c 00000000 -t -e\
	--radius 110 \
	--ring-width 12 \
	--inside-color=4C566A1A \
	--ring-color=3B4252CC \
	--insidever-color=5E81AC1A \
	--ringver-color=A3BE8CCC \
	--insidewrong-color=BF616ACC \
	--ringwrong-color=2E3440CC \
	--line-color=434C5EFF \
	--{key,bs}hl-color=8FBCBBCC \
	--separator-color=5E81ACCC \
	--{verif,wrong,modif}-color=B48EADCC \
	--{layout,time,date,greeter}-color=E5E9F0FF \
        --time-font="FireCode Nerd Font" \
	--date-font="FireCode Nerd Font" \
	--verif-font="FireCode Nerd Font" \
	--wrong-font="FireCode Nerd Font" \
	--greeter-font="FireCode Nerd Font" \
	--greeter-text="$USER" \
	--greeter-size=12 \
	--greeter-pos="w/2:h/2-60" \
	--screen 1                   \
	--blur 5                     \
	--clock                      \
	--indicator                  \
	--time-str="%H:%M:%S"        \
	--date-str="%A, %m %Y"       \
	--keylayout 1                \

#loginctl lock-session
	
