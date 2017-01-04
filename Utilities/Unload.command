#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 143884 $
#   $Date: 2015-12-24 21:02:29 +0100 (Do, 24. Dez 2015) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/Utilities/Unload.command $
############################################################## }}}1 ##########

source ${0:h}/Setup.command

setopt No_X_Trace
setopt Err_Exit

if test "${USER}" = "root"; then
    Unload_System
else
    setopt Multi_OS

    Unload_User
    sudo ${0:a} ${USER} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
