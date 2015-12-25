#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author$
#   $Revision$
#   $Date$
#   $HeadURL$
############################################################## }}}1 ##########

source ${0:h}/Setup.command

setopt No_XTrace
setopt No_Err_Exit

if test "${USER}" = "root"; then
    Deselect_System
    Unload_System
    Update_Tree
    Update_Packages

    ${0:h}/Install_Python.command

    setopt Err_Exit
    for I in			    \
	"qt4_select"		    \
	"qt4-mac"		    \
	"qt4-mac-sqlite3-plugin"    \
	"doxygen +wizard"
    do
	Install_Update ${=I} "${Qt_Variants}${General_Variants}"
    done; unset I

    for I in			    \
	"akonadi"		    \
	"kdelibs4"		    \
	"kde4-baseapps"		    \
	"kdepim4"		    \
	"amarok"
    do
	# KDE libs hang in compile with 8 cores.
	# build.jobs=1
	Install_Update ${=I} "${Qt_Variants}"
    done; unset I

    Load_System
    Select_System
    Clean
else
    setopt Multi_OS

    Unload_User
    sudo ${0:a} ${USER} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out
    Load_User
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
