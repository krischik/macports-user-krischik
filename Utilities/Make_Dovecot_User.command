#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author$
#   $Revision$
#   $Date$
#   $HeadURL$
############################################################## }}}1 ##########

setopt X_Trace
setopt No_Err_Exit

if test "${USER}" = "root"; then
    dscl . -create /Groups/_dovecot
    dscl . -create /Groups/_dovecot UniqueID 30
    dscl . -create /Users/_dovecot
    dscl . -create /Users/_dovecot UserShell /bin/false
    dscl . -create /Users/_dovecot RealName "Dovecot IMAP Server"
    dscl . -create /Users/_dovecot UniqueID 30
    dscl . -create /Users/_dovecot PrimaryGroupID 30
    dscl . -create /Users/_dovecot NFSHomeDirectory /opt/local/var/run/dovecot

    defaults write /Library/Preferences/com.apple.loginwindow HiddenUsersList -array-add _fetchmail _dovecot
else
    setopt Multi_OS

    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
