#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 95221 $
#   $Date: 2012-07-07 11:30:13 +0200 (Sa, 07. Jul 2012) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/Utilities/Restart_DBus.command $
############################################################## }}}1 ##########

setopt No_X_Trace
setopt No_Err_Exit

if test "${USER}" = "root"; then

    pushd /opt/local/etc/ssl/certs
        if ! test -e AOL_Member_CA.pem ; then
            gln --symbolic  /opt/local/share/purple/ca-certs/* .
        fi
    popd

    if ! test -e /Library/LaunchAgents/org.freedesktop.dbus-session.plist; then
        ln -s                                                                   \
            /opt/local/Library/LaunchAgents/org.freedesktop.dbus-session.plist  \
            /Library/LaunchAgents/org.freedesktop.dbus-session.plist
    fi

    launchctl stop         org.freedesktop.dbus-session
    launchctl unload -w    /Library/LaunchAgents/org.freedesktop.dbus-session.plist
    launchctl load   -w    /Library/LaunchAgents/org.freedesktop.dbus-session.plist
    launchctl start         org.freedesktop.dbus-session
else
    setopt Multi_OS

    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 expandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
