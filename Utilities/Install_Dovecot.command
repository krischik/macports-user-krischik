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

    launchctl unload -w "/Library/LaunchDaemons/org.macports.dovecot.plist";
    launchctl unload -w "/Library/LaunchDaemons/org.macports.slapd.plist";

    for I in		\
	"imapfilter"	\
	"openldap"	\
	"dovecot"	;
    do
	Install_Update ${I} ${=General_Variants};
    done; unset I

    launchctl load -w "/Library/LaunchDaemons/org.macports.slapd.plist";
    launchctl load -w "/Library/LaunchDaemons/org.macports.dovecot.plist";

    port select gcc gnat-gcc42
else
    setopt Multi_OS;
    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out;
fi;

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
