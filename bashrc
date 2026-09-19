# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
	*i*) ;;
	  *) return;;
esac

HISTCONTROL=ignoreboth:erasedups
HISTSIZE=1000

# Use timestamps in the ~/.bash_history file (see strftime(3))
# If your time is not in UTC, replace Z with %z to see an offset (ISO 8601)
HISTTIMEFORMAT="%Y-%m-%dT%H:%M:%SZ "

shopt -s histappend

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Show the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

case "$TERM" in
	xterm-color|*-256color) color_prompt=yes;;
esac

if [ "$color_prompt" == "yes" ]; then
	PS1='${debian_chroot:+($debian_chroot) }[\[\e[1;94m\]\@\[\e[0m\]] [\[\e[1;92m\]\u\[\e[0m\]@\[\e[1;97m\]\h\[\e[0m\] \W]${PS1_CMD1}\n\$ '
else
	PS1='${debian_chroot:+($debian_chroot) }[\@] [\u@\h \W]${PS1_CMD1}\n\$ '
fi
unset color_prompt

case "$TERM" in
	xterm*|rxvt*)
		PS1="\[\e]0;${debian_chroot:+($debian_chroot) }\u@\h: \W\a\]$PS1";;
	*) ;;
esac

if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

	alias ls='ls --color=auto'
	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'

# If you need even more aliases, add them to ~/.bash_aliases
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# Enable auto-completion
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

# Enable Git prompt support
# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
if [ -f ~/.config/git/git-prompt.sh ]; then
	. ~/.config/git/git-prompt.sh
	PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'

	GIT_PS1_SHOWDIRTYSTATE=yes
	GIT_PS1_SHOWSTASHSTATE=yes
	GIT_PS1_SHOWUNTRACKEDFILES=yes
	GIT_PS1_SHOWUPSTREAM="git"
	GIT_PS1_SHOWCONFLICTSTATE=yes
	GIT_PS1_SHOWCOLORHINTS=yes
fi

# -- Anything below is added by installation scripts --
