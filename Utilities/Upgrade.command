#!/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 144160 $
#   $Date: 2016-01-03 19:41:24 +0100 (So, 03. Jan 2016) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/Utilities/Upgrade.command $
############################################################## }}}1 ##########

source ${0:a:h}/Setup.command

setopt No_XTrace
setopt Err_Exit

if test "${USER}" = "root"; then
    Unload_System

    port -qv installed                      > installed.txt
    port echo requested | cut -d ' ' -f 1   > requested.txt
    port -f uninstall installed
    rm -rf "/opt/local/var/macports/build/"*

    ./Install_Minimum.command 

    ./Install.command
    ./Install_VIM.command
    ./Install_VCS.command
    ./Install_Mobile_Development.command
    ./Install_GNOME.command
    ./Install_KDE4.command
    ./Install_Player.command
    ./Install_Maintained.command

    #curl -O https://svn.macports.org/repository/macports/contrib/restore_ports/restore_ports.tcl
    #curl --location --remote-name https://github.com/macports/macports-contrib/raw/master/restore_ports/restore_ports.tcl
    #chmod +x restore_ports.tcl
    #./restore_ports.tcl installed.txt
    #xargs sudo port setrequested < requested.txt

    Clean
else
    setopt Multi_OS

    # xcode-select --install
    Unload_User
    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out
    Load_User
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 expandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
