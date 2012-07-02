#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author$
#   $Revision$
#   $Date$
#   $HeadURL$
############################################################## }}}1 ##########

source ${0:h}/Setup.command

setopt No_X_Trace;
setopt No_Err_Exit

if test "${USER}" = "root"; then
    Unload_System;

    port select gcc gcc42

    Update_Tree
    Update_Packages

    # The dependecies to not work because
    # to few libraries build with +universal
    for I in						    \
	"py26-numpy"
    do
	Install_Update ${=I} "-atlas"
    done; unset I

    for I in						    \
	"gimp2 +gvfs+help_browser +universal"		    \
	"gimp-app +animation +help_browser +gvfs"	    \
	"gimp-help-de"
    do
	Install_Update ${=I} "${=Gnome_Variants}${=General_Variants}"
    done; unset I

    port select gcc gnat-gcc42
    Clean
    Load_System
else
    setopt Multi_OS

    Unload_User
    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out
    Load_User
fi;

# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
