#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 94900 $
#   $Date: 2012-07-02 08:58:52 +0200 (Mo, 02. Jul 2012) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/Utilities/Clean.command $
############################################################## }}}1 ##########

setopt X_Trace
setopt No_Err_Exit

if test "${USER}" = "root"; then
    dscl . -create /Groups/_fetchmail
    dscl . -create /Groups/_fetchmail UniqueID 31
    dscl . -create /Users/_fetchmail
    dscl . -create /Users/_fetchmail UserShell /bin/false
    dscl . -create /Users/_fetchmail RealName "Fetchmail Mail Client"
    dscl . -create /Users/_fetchmail UniqueID 31
    dscl . -create /Users/_fetchmail PrimaryGroupID 31
    dscl . -create /Users/_fetchmail NFSHomeDirectory /opt/local/var/run/fetchmail

    defaults write /Library/Preferences/com.apple.loginwindow HiddenUsersList -array-add _fetchmail _dovecot
else
    setopt Multi_OS

    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 expandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
