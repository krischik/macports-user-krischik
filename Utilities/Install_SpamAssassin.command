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

    launchctl unload -w "/Library/LaunchDaemons/org.macports.spamd.plist";

    for I in					    \
	"p5-mail-spamassassin +bayes+razor+ssl"	    ;
    do
	Install_Update ${I} "${=General_Variants}";
    done; unset I

    pushd /opt/local/etc/mail/spamassassin
	for I in	\
	    init.pre	\
	    local.cf	\
	    v310.pre	\
	    v312.pre	\
	    v320.pre	;
	do
	    if test ! -f "${I}";  then
	       gcp --verbose "${I}.sample" "${I}";
	    fi;
	done; unset I
    popd;

    launchctl load -w "/Library/LaunchDaemons/org.macports.spamd.plist";

    port select gcc gnat-gcc42
else
    setopt Multi_OS;
    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out;
fi;

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
