#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 143895 $
#   $Date: 2015-12-25 08:11:12 +0100 (Fr, 25. Dez 2015) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/Utilities/Install_Mobile_Development.command $
############################################################## }}}1 ##########

source ${0:h}/Setup.command

setopt No_XTrace
setopt No_Err_Exit

if test "${USER}" = "root"; then
    Deselect_System
    Update_Tree
    Update_Packages

    for I in			    \
	"android"		    \
	"ant-contrib"		    \
	"apache-ant"		    \
	"gradle"		    \
	"junit"			    \
	"kotlin"		    \
	"maven3"		    \
	"maven31"		    \
	"maven32"		    \
	"gmake +guile"		    \
	"proguard"		    \
	"scala2.11"		    \
	"scala2.11-docs"	    \
	"scala2.12"		    \
	"scala2.12-docs"
    do
	Install_Update ${I} ${=General_Variants}
    done; unset I

    for I in			    \
	"maven_select"		    \
	"scala_select"
    do
	Install_Update ${I} ${=General_Variants}
    done; unset I

    Select_System
    Clean
else
    setopt Multi_OS

    sudo ${0:a} >&1 2>&2 &>~/Library/Logs/${0:r:t}.out
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
