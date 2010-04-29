#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 52694 $
#   $Date: 2009-06-21 20:48:35 +0200 (So, 21. Jun 2009) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/atari800/Upload.command $
############################################################## }}}1 ##########

setopt No_X_Trace;
setopt Err_Exit;

if test "${USER}" = "root"; then
    dscl . -create /Groups/_netdev

    defaults write /Library/Preferences/com.apple.loginwindow HiddenUsersList -array-add _netdev
else
    setopt Multi_OS;

    sudo ${0:a}
fi;

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 expandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
