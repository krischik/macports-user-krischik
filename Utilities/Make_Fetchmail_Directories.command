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
    gmkdir --parents --verbose /opt/local/var/log/fetchmail
    gmkdir --parents --verbose /opt/local/var/run/fetchmail

    gchown _fetchmail:_fetchmail /opt/local/var/log/fetchmail
    gchown _fetchmail:_fetchmail /opt/local/var/run/fetchmail
    gchown _fetchmail:_fetchmail /private/etc/fetchmailrc
else
    setopt Multi_OS

    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 expandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
