# bat is renamed to batcat on Ubuntu-based distros
alias bat='batcat'

# mfw the decades old scripting language doesn't have quote escaping
alias purge-rc="dpkg -l | grep '^rc' | awk '{print \$2}' | sudo xargs dpkg --purge"
