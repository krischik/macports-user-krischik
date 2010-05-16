#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 52694 $
#   $Date: 2009-06-21 20:48:35 +0200 (So, 21. Jun 2009) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/atari800/Upload.command $
############################################################## }}}1 ##########

source ${0:h}/Setup.command

setopt X_Trace;

if test "${USER}" = "root"; then
    gcc_select gcc42

    launchctl unload -w "/Library/LaunchDaemons/org.macports.spamd.plist"

    for I in							\
	"p5-mail-spamassassin +razor+ssl ${=General_Variants}"	;
    do
	Install_Update ${I};
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

    launchctl load -w "/Library/LaunchDaemons/org.macports.spamd.plist"

    gcc_select gnat-gcc
else
    setopt Multi_OS;
    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out;
fi;

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
