#!/bin/bash

# https://github.com/yedhink
# Feel free to share with your friends

# install wmctrl. Its a prerequisite to make this script work.

# Launch it in your i3 config file
# exec --no-startup-id ~/dotfiles_ikigai/scripts/init_workspace.sh
#
# Dont forget to make it executable : # chmod 777 init_workspace.sh
# HAVE FUN !

# App you want to start :
apps=(
 #if you're using some other terminal then replace urxvt with that	
 "urxvt"
)

# Which workspace you want to assign to your wanted App :
workspaces=(
"1"
)

# counter of opened windows
owNB=0

# add paths of apps to array
arr=()
arr+=( '/usr/bin/' )

for iwin in ${!apps[*]}
do
    while [ "$owNB" -lt "$iwin" ] # wait before start other programs
    do
        owNB=$(wmctrl -l | wc -l) # Get number of actual opened windows
    done

    i3-msg workspace ${workspaces[$iwin]} # move in wanted workspace
    ${arr[$iwin]}/${apps[$iwin]} & # start the wanted app
done

####### ABSOLUTELY OPTIONAL ########
## inject message(s) into terminal (first one created : /dev/pts/0)

# wait a moment
sleep 4 

~/dotfiles_ikigai/scripts/sysinfo.sh > /dev/pts/0
~/dotfiles_ikigai/scripts/neostart.sh > /dev/pts/0
