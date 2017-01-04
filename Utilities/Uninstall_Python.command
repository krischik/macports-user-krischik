#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 143003 $
#   $Date: 2015-12-01 15:44:30 +0100 (Di, 01. Dez 2015) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/Utilities/Uninstall_Python.command $
############################################################## }}}1 ##########

source ${0:h}/Setup.command

setopt No_X_Trace
setopt No_Err_Exit

if test "${USER}" = "root"; then

    port uninstall  \
	"python26"  \
	"py26-*"    \
	"python34"  \
	"py34-*"

else
    setopt Multi_OS
    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
