#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 94920 $
#   $Date: 2012-07-02 14:29:54 +0200 (Mo, 02. Jul 2012) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/Utilities/Uninstall_KDE4.command $
############################################################## }}}1 ##########

setopt No_XTrace
setopt No_Err_Exit

if test "${USER}" = "root"; then
    Unload_System

    for I in		    \
	"gcc6"              \
	"llvm-3.7"	    \
	"llvm-3.9"
    do
	port uninstall --follow-dependents ${=I}
    done; unset I

    Load_System
else
    setopt Multi_OS

    Unload_User
    sudo ${0} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out
    Load_User
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :