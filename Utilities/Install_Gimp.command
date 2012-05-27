#!/opt/local/bin/zsh

source ${0:h}/Setup.command

setopt No_X_Trace;

if test "${USER}" = "root"; then
    Unload_System;

    port select gcc gcc42

    Update_Tree
    Update_Packages

    # The dependecies to not work because
    # to few libraries build with +universal
    for I in						    \
	"py26-numpy"					    \
	"gimp2 +gvfs+help_browser +universal -atlas"	    \
	"gimp-app +animation +help_browser +gvfs -atlas"    \
	"gimp-user-manual +de -atlas"
    do
	Install_Update ${=I} ${=Gnome_Variants}
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
