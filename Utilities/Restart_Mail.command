#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 97540 $
#   $Date: 2012-09-08 14:39:54 +0200 (Sa, 08. Sep 2012) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/Utilities/Restart_Dovecot.command $
############################################################## }}}1 ##########

setopt No_X_Trace
setopt No_Err_Exit

##########
# Retired applications, replaced by Diskstation
#
# launchctl unload -w "/Library/LaunchDaemons/org.macports.dovecot.plist"
# launchctl load   -w "/Library/LaunchDaemons/org.macports.dovecot.plist"
# launchctl unload -w "/Library/LaunchDaemons/org.macports.slapd.plist"
# launchctl load   -w "/Library/LaunchDaemons/org.macports.slapd.plist"
##########

if test "${USER}" = "root"; then
else
    setopt Multi_OS

    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out
    
    #launchctl load -w "/Library/LaunchDaemons/com.krischik.fetchmail.plist"
    #launchctl load -w "/Library/LaunchDaemons/com.krischik.fetchmail.plist"
    #port load fetchmail

    ps auxw | grep "dovecot\|imap\|pop3"
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
