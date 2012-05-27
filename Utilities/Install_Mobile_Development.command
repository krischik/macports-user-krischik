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
    Foce_Activate;
    Update_Packages;

    for I in				\
	"android ${=General_Variants}"	\
	"antenna ${=General_Variants}"	\
	"microemu ${=General_Variants}"	\
	"proguard ${=General_Variants}"	\
	"wine"				;
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
