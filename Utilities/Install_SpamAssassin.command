#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 143895 $
#   $Date: 2015-12-25 08:11:12 +0100 (Fr, 25. Dez 2015) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/Utilities/Install_SpamAssassin.command $
############################################################## }}}1 ##########

source ${0:h}/Setup.command

setopt No_XTrace
setopt No_Err_Exit

if test "${USER}" = "root"; then
    Deselect_System

    launchctl unload -w "/Library/LaunchDaemons/org.macports.spamd.plist"

    for I in					    \
	"clamav +clamav_milter"			    \
	"p5-mail-spamassassin +bayes+razor+ssl"
    do
	Install_Update ${I} "${=General_Variants}"
    done; unset I

    pushd /opt/local/etc/mail/spamassassin
	for I in	\
	    init.pre	\
	    local.cf	\
	    v310.pre	\
	    v312.pre	\
	    v320.pre
	do
	    if test ! -f "${I}";  then
	       gcp --verbose "${I}.sample" "${I}"
	    fi
	done; unset I
    popd

    launchctl load -w "/Library/LaunchDaemons/org.macports.spamd.plist"

    Select_System
    Clean
else
    setopt Multi_OS
    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
