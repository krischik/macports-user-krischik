#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 133186 $
#   $Date: 2015-02-23 14:59:43 +0100 (Mo, 23 Feb 2015) $
#   $HeadURL: https://svn.macports.org/repository/macports/users/krischik/Utilities/Update.command $
############################################################## }}}1 ##########

source ${0:a:h}/Setup.command

setopt No_X_Trace
setopt No_Err_Exit

if test "${USER}" = "root"; then
    #Unload_System

    Install_Minimum.command*
    Install.command*
    Install_VIM.command*
    Install_VCS.command*
    Install_Mobile_Development.command*
    Install_Gimp.command*
    Install_GNOME.command*
    Install_KDE4.command*
    Install_Player.command*

    if test ""${HOSTNAME}" = "macpro.local"; then
	Install_BitTornado.command*
	Install_Dovecot.command*
	Install_Maintained.command*
	Install_Python.command*
	Install_SpamAssassin.command*
    fi

    Clean
    Load_System
else
    setopt Multi_OS

    Unload_User
    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out
    Load_User
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
