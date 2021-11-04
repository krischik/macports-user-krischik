#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 97540 $
#   $Date: 2012-09-08 14:39:54 +0200 (Sa, 08. Sep 2012) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/Utilities/Uninstall_GNOME.command $
############################################################## }}}1 ##########

source ${0:h}/Setup.command

setopt No_XTrace
setopt No_Err_Exit

if test "${USER}" = "root"; then
    Unload_System

    for I in			\
	"antenna"		\
	"apache2"		\
	"maven31"		\
	"maven32"		\
	"docker"		\
	"openjdk11"		\
	"fontforge"		\
	"gcc6"			\
	"gcc8"			\
	"llvm-3.7"		\
	"llvm-3.9"		\
	"microemu"
    do
	Un_Install ${=I}
    done; unset I

    Clean
    Load_System
else
    setopt Multi_OS
    Unload_User


    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out
    Load_User
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
