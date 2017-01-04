#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 94920 $
#   $Date: 2012-07-02 14:29:54 +0200 (Mo, 02. Jul 2012) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/Utilities/Make_DBus_User.command $
############################################################## }}}1 ##########

setopt No_X_Trace
setopt Err_Exit

if test "${USER}" = "root"; then
    dscl . -create /Groups/_netdev

    defaults write /Library/Preferences/com.apple.loginwindow HiddenUsersList -array-add _netdev
else
    setopt Multi_OS

    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 expandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
