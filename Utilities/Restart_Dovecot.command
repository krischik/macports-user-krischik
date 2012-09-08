#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author$
#   $Revision$
#   $Date$
#   $HeadURL$
############################################################## }}}1 ##########

setopt No_X_Trace
setopt No_Err_Exit

if test "${USER}" = "root"; then
    launchctl unload -w "/Library/LaunchDaemons/org.macports.dovecot.plist"
    launchctl unload -w "/Library/LaunchDaemons/org.macports.slapd.plist"
    launchctl load   -w "/Library/LaunchDaemons/org.macports.slapd.plist"
    launchctl load   -w "/Library/LaunchDaemons/org.macports.dovecot.plist"
else
    setopt Multi_OS

    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out

    ps auxw | grep "dovecot\|imap\|pop3"
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
