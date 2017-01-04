#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 95269 $
#   $Date: 2012-07-08 10:54:07 +0200 (So, 08. Jul 2012) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/Utilities/Make_Postfix_Directories.command $
############################################################## }}}1 ##########

setopt X_Trace
setopt No_Err_Exit

if test "${USER}" = "root"; then
    gmkdir --parents --verbose /opt/local/var/lib/postfix

    gchown --recursive _postfix:_postfix /opt/local/var/lib/postfix
    gchown --recursive _postfix:_postfix /opt/local/var/lib/postfix/*(D)
else
    setopt Multi_OS

    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
