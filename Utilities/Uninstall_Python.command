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

    port uninstall "python26" "py26-*"
    port uninstall "python27" "py27-*"
    port uninstall "python34" "py34-*"
    port uninstall "python35" "py35-*"
    port uninstall "python36" "py36-*"
#   port uninstall "python37" "py37-*"

else
    brew

    setopt Multi_OS
    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
