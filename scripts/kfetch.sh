#!/bin/bash

# colors
black='\033[30m'
red='\033[31m'
green='\033[32m'
yellow='\033[33m'
blue='\033[34m'
magenta='\033[35m'
cyan='\033[36m'
white='\033[37m'
reset='\033[0m'
bold='\033[1m'
italic='\033[3m'
underline='\033[4m'

# icons
arch="${magenta}  ${reset}"
clock="${magenta}󱑂  ${reset}" 
penguin="${magenta}󰌽  ${reset}"
keyboard="${magenta}󰌌  ${reset}"

# information to show
# user
me=${yellow}`whoami`${reset}${red}@${reset}${cyan}`hostnamectl hostname`

#os
os=`hostnamectl | grep 'Operating System:' | cut -d ':' -f2 | xargs`

# date
dt=`date +"%d %b %H:%M"`

#kernel
ker=`hostnamectl | grep 'Kernel:' | cut -d ':' -f2 | xargs`

#uptime
work=`uptime --pretty | sed 's/up//' | xargs`

#final output
echo -e "
${bold}${red}
	___________________________________  
	| _____ |   | ___ | ___ ___ | |   | |
	| |   | |_| |__ | |_| __|____ | | | |
	| | | |_________|__ |______ |___|_| |		${me}
	| |_|   | _______ |______ |   | ____|		${arch}${os}
${magenta}	| ___ | |____ | |______ | |_| |____ |		${clock}${dt}
	|___|_|____ | |   ___ | |________ | |		${penguin}${ker}
${yellow}	|   ________| | |__ | |______ | | | |		${keyboard}${work}
${cyan}	| | | ________| | __|____ | | | __| |
${green}	|_| |__ |   | __|__ | ____| | |_| __|
	|   ____| | |____ | |__ |   |__ |__ |
	| |_______|_______|___|___|___|_____|
${reset}
"
