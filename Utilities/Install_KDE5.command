#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 143895 $
#   $Date: 2015-12-25 08:11:12 +0100 (Fr, 25. Dez 2015) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/Utilities/Install_KDE4.command $
############################################################## }}}1 ##########

source ${0:h}/Setup.command

setopt No_XTrace
setopt No_Err_Exit

if test "${USER}" = "root"; then
    Deselect_System
    Unload_System
    Update_Tree
    Update_Packages

    ${0:h}/Install_Develop.command
    ${0:h}/Install_Python.command

    for I in			    \
	"qt5_select"		    \
	"qt5-mac-sqlite3-plugin"    \
	"qt5-mac"		    \
	"qt5-sqlite-plugin"	    \
	"qt5"
    do
	Install_Update ${=I} "${Qt_Variants}${General_Variants}"
    done; unset I

    for I in			    \
	"akonadi"		    \
	"kde-l10n-de"		    \
	"kdelibs5"		    \
	"kde5-baseapps"		    \
	"kdiskfree"		    \
	"kdepim5"		    \
	"amarok"		    \
	"MP4Joiner"		    \
	"wireshark3"		    \
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
