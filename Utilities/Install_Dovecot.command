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
    gcc_select gcc42

    launchctl unload -w "/Library/LaunchDaemons/org.macports.dovecot.plist";

    for I in							\
	"dovecot"	;
    do
	Install_Update ${I} ${=General_Variants};
    done; unset I

    launchctl load -w "/Library/LaunchDaemons/org.macports.dovecot.plist";

    gcc_select gnat-gcc
else
    setopt Multi_OS;
    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out;
fi;

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
