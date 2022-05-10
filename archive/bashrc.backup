# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# aliases
alias md=markdown

# Pierre Bomel for LINOROBOT + ROS

export ROSKIND=melodic
source /opt/ros/$ROSKIND/setup.bash
echo ROS_DISTRO $ROS_DISTRO
#source $HOME/catkin_ws/devel/setup.bash
#source $HOME/linorobot_ws/devel/setup.bash
#source $HOME/ydlidar_ws/devel/setup.bash
echo ROS_PACKAGE_PATH $ROS_PACKAGE_PATH

# added at the end
#export LINOLIDAR=ydlidar
#export LINOBASE=4wd

# IP addresses depend on the wifi network used
#network="local" # KK mobile phone
#network="cfiax" # KK mobile phone
network="linorobot" # wifi linorobot at LO
#network="ccbox" # SFR wifi box at CC
#network="ccbox5GHz" # SFR wifi box at CC
#network="ccbml" # wifi mesh at CC
#network="ether" # cable between PC and robot
#network="AndroidHotspot7067" #ludo mobile phone






# configuration = where is hosted the base robot control
#config="vm" # in a VM on the dev PC
config="pi4" # in a Raspberry PI4
#config="jetson-nano" # in a Jetson-nano
echo robot base control is hosted by a $config

export VM_IP="0.0.0.0"
export DEVPC_IP=0.0.0.0
export ROBOT_IP=0.0.0.0

case $network in
  local)
	echo "network is local"
	export DEVPC_IP=127.0.0.1
	export ROBOT_IP=127.0.0.1
	;;
  cfiax)
	echo "network is KK3 mobile phone"
	export DEVPC_IP=192.168.43.121
	#export VM_IP=192.168.43.197
	export PI4_IP=192.168.43.169
	export ROBOT_IP=$PI4_IP
	;;
  ccbox)
	echo "network is SFR box at CC"
	;;
  ccbox5GHz)
        echo "network is 5GHz SFR box at CC"
        export DEVPC_IP=192.168.1.87
        export ROBOT_IP=192.168.1.99
        ;;
  ccbml)
	echo "network is ccbml wifi mesh at CC"
	export DEVPC_IP=10.0.0.12
	export ROBOT_IP=10.0.0.10
	#export VM_IP=10.0.0.9
	;;
  ether)
	echo "network is an Ethernet cable"
	export DEVPC_IP=192.168.137.248
	export ROBOT_IP=192.168.137.105
	;;
  linorobot)
	echo "network is wifi-linorobot at LO"
	export DEVPC_IP=192.168.202.101
	export ROBOT_IP=192.168.202.103
	;;
  AndroidHotspot7067)
	echo "network is ludo mobile phone"

	;;
  *) 
	echo "I don't know what network we are using"
	;;
esac
echo ROBOT_IP $ROBOT_IP
echo DEVPC_IP $DEVPC_IP

# ROS role
#whoiam="devpc"
whoiam="robot"
export ROS_PORT=11311

case $whoiam in
    robot)
	echo "I am the robot"
	ROS_HOSTNAME=$ROBOT_IP
	;;
    devpc)
	echo "I am the devpc"
	ROS_HOSTNAME=$DEVPC_IP
	;;
    *) 
	echo "I don't know who I am"
	ROS_HOSTNAME="????"
	;;
esac

echo ROS_HOSTNAME $ROS_HOSTNAME

# roscore always runs on robot
echo roscore runs on the robot
export ROS_MASTER_URI=http:"//$ROBOT_IP:$ROS_PORT"
echo ROS_MASTER_URI $ROS_MASTER_URI

# automatically added by linorobot's install
export LINOLIDAR=ydlidar
export LINOBASE=4wd
source /home/pi/linorobot_ws/devel/setup.bash

#j'ai tester sa pour le probleme avec imu_filter_madgwick
#source /home/pi/ros_catkin_ws/devel_isolated/setup.bash

export ROS_IP=192.168.202.103
#export ROS_HOSTNAME=raspberrypi

#Synchro le temps avec le serveur
#ntpdate -d 192.168.202.105


offline="false"
case $offline in 
	true)
	echo "ROS is in offline mode. Software like RViz will not work on remote pc."
	export ROS_IP=localhost	
	export ROS_MASTER_URI=http://localhost:11311
	export ROS_HOSTNAME=localhost
	;;

	false)
	echo "ROS is in connected mode. Software like RViz are available on remote pc."
	export ROS_IP=192.168.202.103
	export ROS_MASTER_URI=http://$ROBOT_IP:$ROS_PORT
	;;
esac


