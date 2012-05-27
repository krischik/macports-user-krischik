#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author$
#   $Revision$
#   $Date$
#   $HeadURL$
############################################################## }}}1 ##########

source ${0:h}/Setup.command

setopt X_Trace;

if test "${USER}" = "root"; then
    port select gcc gcc42

    Update_Tree;
    Update_Packages;

    for I in				    \
	"python27 ${=General_Variants}"	    \
	"py27-ctypes ${=General_Variants}"  \
	"py27-crypto  ${=General_Variants}" \
	"py27-tkinter ${=General_Variants}" ;
    do
	Install_Update ${I} --enforce-variants;
    done; unset I

    port select python25
    port select gcc gnat-gcc42
else
    setopt Multi_OS;
    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out;
fi;

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
