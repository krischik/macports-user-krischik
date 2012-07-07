#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author$
#   $Revision$
#   $Date$
#   $HeadURL$
############################################################## }}}1 ##########

source ${0:h}/Setup.command

setopt No_X_Trace
setopt No_Err_Exit

if test "${USER}" = "root"; then
    port select gcc gcc42

    launchctl unload -w "/Library/LaunchDaemons/com.krischik.fetchmail.plist"
    launchctl unload -w "/Library/LaunchDaemons/org.macports.dovecot.plist"
    launchctl unload -w "/Library/LaunchDaemons/org.macports.slapd.plist"
    launchctl unload -w "/Library/LaunchDaemons/org.macports.postfix.plist"
    launchctl unload -w "/System/Library/LaunchDaemons/org.postfix.master.plist"

    for I in				    \
	"openldap"			    \
	"dovecot"			    \
	"fetchmail +fetchmailconf+ssl+ntml" \
	"imapfilter"			    \
	"postfix +dovecot+pcre+tls"
    do
	Install_Update ${I} ${=General_Variants}
    done; unset I

    launchctl load -w "/Library/LaunchDaemons/org.macports.postfix.plist"
    launchctl load -w "/Library/LaunchDaemons/org.macports.slapd.plist"
    launchctl load -w "/Library/LaunchDaemons/org.macports.dovecot.plist"
    launchctl load -w "/Library/LaunchDaemons/com.krischik.fetchmail.plist"

    port select gcc gnat-gcc42
else
    setopt Multi_OS
    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
