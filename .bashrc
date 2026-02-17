# If not running interactively, don't do anything
case $- in
	*i*) ;;
	  *) return;;
esac

# Ignore duplicates and lines starting with space
HISTCONTROL=ignoreboth

# Limit .bash_history to 1000 lines and command history to 500 commands
HISTFILESIZE=1000
HISTSIZE=500

# Append to .bash_history instead of overwriting it
shopt -s histappend

# Update LINES and COLUMNS to fit the window size
shopt -s checkwinsize

# Allow usage of the "**" pattern
shopt -s globstar

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# If working in the chroot, set a variable for the prompt
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

# Enable support for Git if $HOME/.config/git/git-prompt.sh exists
if [ -f "$HOME/.config/git/git-prompt.sh" ]; then
	source "$HOME/.config/git/git-prompt.sh"
	PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'
fi

# If the terminal supports color, use a colored prompt
case "$TERM" in
	xterm-color|*-256color) color_prompt=yes;;
esac

# Default prompts are commented out
if [ "$color_prompt" = yes ]; then
	PS1='${debian_chroot:+($debian_chroot) }[\@] [\[\e[1;92m\]\u\[\e[0m\]@\[\e[1;96m\]\h\[\e[0m\] \W]${PS1_CMD1}\n\$ '
	#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
	PS1='${debian_chroot:+($debian_chroot) }[\@] [\u@\h \W]${PS1_CMD1}\n\$ '
	#PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt

# If using an xterm, set the window title
case "$TERM" in
	xterm*|rxvt*)
		PS1="\[\e]0;${debian_chroot:+($debian_chroot) }\u@\h: \W\a\]$PS1"
		#PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
		;;
	*) ;;
esac

# Color support for ls(1) and grep(1)
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias    ls='ls --color=auto'
	alias  grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# More ls(1) aliases
alias ll='ls -alF'
alias la='ls -A'
alias  l='ls -CF'

# Add new aliases to .bash_aliases
if [ -f "$HOME/.bash_aliases" ]; then
	source "$HOME/.bash_aliases"
fi

# Auto-completion
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		source /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		source /etc/bash_completion
	fi
fi

# git-bash.sh is a script I wrote to quickly start ssh-agent(1) with keys
# required for Git commit signing and GitHub SSH authentication
if [ -f "$HOME/.config/git/git-bash.sh" ]; then
	source "$HOME/.config/git/git-bash.sh"
fi

# Anything below is added by installation scripts
