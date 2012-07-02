#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 94900 $
#   $Date: 2012-07-02 08:58:52 +0200 (Mo, 02. Jul 2012) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/Utilities/Clean.command $
############################################################## }}}1 ##########

setopt No_X_Trace
setopt No_Err_Exit

if test "${USER}" = "root"; then

    pushd /opt/local/etc/ssl/certs
        if ! test -e AOL_Member_CA.pem ; then
            gln --symbolic  /opt/local/share/purple/ca-certs/* .
        fi
    popd

    launchctl stop         com.krischik.fetchmail
    launchctl unload -w    /Library/LaunchDaemons/com.krischik.fetchmail.plist
    launchctl load   -w    /Library/LaunchDaemons/com.krischik.fetchmail.plist
    launchctl start        com.krischik.fetchmail
else
    setopt Multi_OS

    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 expandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
