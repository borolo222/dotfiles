#!/bin/bash



xss-lock -- i3lock -n -k -B sigma --indicator --debug\
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
	--keylayout mode 2 

loginctl lock-session
	
