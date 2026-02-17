#!/usr/bin/env bash

# git-bash.sh
# Start ssh-agent(1) for Git commit signing and GitHub SSH authentication
#
# Source this script in your .bashrc file to use following commands:
# - gb-change-prompt   : Appends (Git) prefix to your original prompt
# - gb-restore-prompt  : Restores your original prompt
# - gb-start-ssh-agent : Starts ssh-agent
# - gb-stop-ssh-agent  : Stops ssh-agent and unsets its variables
# - gb-add-ssh-keys    : Adds your private keys to ssh-agent (CONFIGURE IT!)
#
# Following aliases will execute a chain of commands above:
# - gb-start : Starts ssh-agent, adds private keys and changes the prompt
# - gb-stop  : Stops ssh-agent and restores the prompt

# $PS1_ORIGINAL is used to store the original prompt
export PS1_ORIGINAL=$PS1

# gb-change-prompt
# Append (Git) prefix to the original prompt if ssh-agent is running
function gb-change-prompt()
{
	if [ -n "$SSH_AGENT_PID" ]; then
		PS1="(Git) $PS1_ORIGINAL"
	fi
}

# gb-restore-prompt
# Restore the original prompt stored in $PS1_ORIGINAL variable
function gb-restore-prompt()
{
	PS1=$PS1_ORIGINAL
}

# gb-start-ssh-agent
# Start ssh-agent if no other agent is currently running
function gb-start-ssh-agent()
{
	if [ -z "$SSH_AGENT_PID" ]; then
		eval "$(ssh-agent -s > /dev/null)"
	fi
}

# gb-stop-ssh-agent
# Stop ssh-agent and unset its variables
function gb-stop-ssh-agent()
{
	if [ -n "$SSH_AGENT_PID" ]; then
		ssh-agent -k > /dev/null
	fi
	unset SSH_AGENT_PID SSH_AUTH_SOCK
}

# gb-add-ssh-keys
# Add private keys to ssh-agent using ssh-add(1)
function gb-add-ssh-keys()
{
	# Due to privacy reasons, this function is not configured.
	# You must edit the ssh-add line to use your own private keys.
	# After doing so, you can comment out or completely remove the echo line.
	#ssh-add $HOME/.ssh/<private_keys> &> /dev/null
	echo -e "\e[0;33mWARN: gb-add-ssh-keys is not configured\e[0m"
}

# gb-start
# Run commands to start ssh-agent, add private keys and change the prompt
alias gb-start='gb-start-ssh-agent && gb-add-ssh-keys && gb-change-prompt'

# gb-stop
# Run commands to stop ssh-agent and restore the prompt
alias gb-stop='gb-stop-ssh-agent && gb-restore-prompt'
