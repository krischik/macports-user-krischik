#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 52694 $
#   $Date: 2009-06-21 20:48:35 +0200 (So, 21. Jun 2009) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/atari800/Upload.command $
############################################################## }}}1 ##########

setopt X_Trace;
setopt No_Err_Exit;

if test "${USER}" = "root"; then
    gmkdir --parents --verbose /opt/local/var/log/dovecot
    gmkdir --parents --verbose /opt/local/var/run/dovecot
    gmkdir --parents --verbose /opt/local/etc/ssl/certs
    gmkdir --parents --verbose /opt/local/etc/ssl/private
    
    gchown --recursive _dovecot:_dovecot /opt/local/var/log/dovecot
    gchown --recursive _dovecot:_dovecot /opt/local/var/run/dovecot 
    gchown --recursive _dovecot:_dovecot /opt/local/etc/dovecot 
else
    setopt Multi_OS;

    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out;
fi;

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
