#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author$
#   $Revision$
#   $Date$
#   $HeadURL$
############################################################## }}}1 ##########

source ${0:h}/Setup.command

setopt No_X_Trace;
setopt No_Err_Exit;

if test "${USER}" = "root"; then
    port select gcc gcc42

    Update_Tree;
    Foce_Activate;
    Update_Packages;

    for I in		    \
	"android"	    \
	"antenna"	    \
	"maven3"	    \
	"microemu"	    \
	"proguard"	    \
	"scala29"	    \
	"scala_select"	    ;
    do
	Install_Update ${I} ${=General_Variants};
    done; unset I

    for I in		    \
	"wine"		    ;
    do
	Install_Update ${I};
    done; unset I

    port select gcc gnat-gcc42
else
    setopt Multi_OS;
    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out;
fi;

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
