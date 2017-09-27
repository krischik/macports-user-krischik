#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 143884 $
#   $Date: 2015-12-24 21:02:29 +0100 (Do, 24. Dez 2015) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/Utilities/Uninstall_Dovecot.command $
############################################################## }}}1 ##########

source ${0:h}/Setup.command

setopt No_XTrace
setopt No_Err_Exit

##########
# Retired applications, replaced by Diskstation
#
#   launchctl unload -w "/Library/LaunchDaemons/org.macports.dovecot.plist"
#   launchctl unload -w "/Library/LaunchDaemons/org.macports.slapd.plist"
#   launchctl unload -w "/Library/LaunchDaemons/org.macports.postfix.plist"
#   launchctl unload -w "/System/Library/LaunchDaemons/org.postfix.master.plist"
##########

if test "${USER}" = "root"; then
    Deselect_System

    launchctl unload -w "/Library/LaunchDaemons/com.krischik.fetchmail.plist"

    for I in				    \
	"fetchmail"			    \
	"imapfilter"			    \
        "p5-mail-spamassassin"
    do
	Un_Install ${I}
    done; unset I

    Select_System
else
    setopt Multi_OS
    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
