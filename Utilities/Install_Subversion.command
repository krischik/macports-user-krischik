#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author$
#   $Revision$
#   $Date$
#   $HeadURL$
############################################################## }}}1 ##########

source ${0:h}/Setup.command

setopt No_X_Trace;

if test "${USER}" = "root"; then
    port select gcc gcc42

    Update_Tree;
    Update_Packages;

    for I in										    \
	"junit ${=General_Variants}"							    \
	"subversion +bash_completion+tools+mod_dav_svn+unicode_path${=General_Variants}"    \
	"cvs2svn ${=General_Variants}"							    \
	"subversion-javahlbindings ${=General_Variants}"					    ;
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
