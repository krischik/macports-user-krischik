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
    dscl . -create /Groups/_fetchmail
    dscl . -create /Groups/_fetchmail RealName "Fetchmail Mail Client"
    dscl . -create /Groups/_fetchmail UniqueID 40_fetchmail UniqueID 40

    dscl . -create /Users/_fetchmail
    dscl . -create /Users/_fetchmail NFSHomeDirectory /opt/local/var/run/fetchmail
    dscl . -create /Users/_fetchmail PrimaryGroupID 40
    dscl . -create /Users/_fetchmail RealName "Fetchmail Mail Client"
    dscl . -create /Users/_fetchmail UniqueID 40
    dscl . -create /Users/_fetchmail UserShell /bin/false

    defaults write /Library/Preferences/com.apple.loginwindow HiddenUsersList -array-add _fetchmail _dovecot

    dscl . -read /Users/_fetchmail
    dscl . -read /Groups/_fetchmail
else
    setopt Multi_OS

    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 expandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
