#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 144160 $
#   $Date: 2016-01-03 19:41:24 +0100 (So, 03. Jan 2016) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/Utilities/Upgrade.command $
############################################################## }}}1 ##########

source ${0:a:h}/Setup.command

setopt No_X_Trace
setopt No_Err_Exit

if test "${USER}" = "root"; then
    Unload_System

    #port -qv installed > myports.txt
    #port echo requested | cut -d ' ' -f 1 > requested.txt
    #port -f uninstall installed
    #rm -rf "/opt/local/var/macports/build/"*

    ./Install.command
    ./Install_VIM.command
    ./Install_VCS.command
    ./Install_Mobile_Development.command
    ./Install_Gimp.command
    ./Install_GNOME.command
    ./Install_KDE4.command
    ./Install_Player.command

    case "${HOSTNAME}" in
	(macpro-eth1*)
	    ./Install_BitTornado.command
	;;
	(iMac*)
	    #./Install_Dovecot.command
	    ./Install_Maintained.command
	    ./Install_SpamAssassin.command
	;;
    esac

    #curl -O https://svn.macports.org/repository/macports/contrib/restore_ports/restore_ports.tcl
    #chmod +x restore_ports.tcl
    #./restore_ports.tcl myports.txt
    #xargs sudo port setrequested < requested.txt

    Clean
else
    setopt Multi_OS

    Unload_User
    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out
    Load_User
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
