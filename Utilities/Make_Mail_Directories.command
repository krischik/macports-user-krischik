#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 133186 $
#   $Date: 2015-02-23 14:59:43 +0100 (Mo, 23. Feb 2015) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/Utilities/Make_Fetchmail_Directories.command $
############################################################## }}}1 ##########

setopt X_Trace
setopt No_Err_Exit

if test "${USER}" = "root"; then
    gmkdir --parents --verbose /opt/local/var/log/fetchmail
    gmkdir --parents --verbose /opt/local/var/run/fetchmail

    gchown --recursive  _fetchmail:_fetchmail /opt/local/var/log/fetchmail
    gchown --recursive  _fetchmail:_fetchmail /opt/local/var/run/fetchmail
    gchown              _fetchmail:_fetchmail /private/etc/fetchmailrc
    gchown              _fetchmail:_fetchmail /opt/local/etc/fetchmailrc
    gchmod go-rwx                             /private/etc/fetchmailrc
    gchmod go-rwx                             /opt/local/etc/fetchmailrc

    gls ${=LS_OPTIONS} --format=long --all --human-readable --classify --directory  \
        /opt/local/var/log/fetchmail                                                \
        /opt/local/var/run/fetchmail                                                \
        /opt/local/etc/fetchmailrc                                                  \
        /private/etc/fetchmailrc
else
    setopt Multi_OS

    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 expandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
