#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 143895 $
#   $Date: 2015-12-25 08:11:12 +0100 (Fr, 25. Dez 2015) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/Utilities/Install_Dovecot.command $
############################################################## }}}1 ##########

source ${0:h}/Setup.command

setopt No_XTrace

##########
# Retired applications, replaced by Diskstation
# Got Mac OS X Server now so I won't need the Macport versions any more 
#
# launchctl unload -w "/Library/LaunchDaemons/org.macports.dovecot.plist"
# launchctl unload -w "/Library/LaunchDaemons/org.macports.slapd.plist"
# launchctl unload -w "/Library/LaunchDaemons/org.macports.postfix.plist"
# launchctl unload -w "/System/Library/LaunchDaemons/org.postfix.master.plist"
# Got Mac OS X Server now so I won't need the Macport versions any more 
#
# "dovecot"			    
# "postfix +dovecot+sasl+pcre+tls"
# "openldap"			    
# "curl-ca-bundle"		    
#
# launchctl load -w "/Library/LaunchDaemons/org.macports.postfix.plist"
# launchctl load -w "/Library/LaunchDaemons/org.macports.slapd.plist"
# launchctl load -w "/Library/LaunchDaemons/org.macports.dovecot.plist"
##########

if test "${USER}" = "root"; then
    Deselect_System

    setopt No_Err_Exit

    #launchctl unload -w "/Library/LaunchDaemons/com.krischik.fetchmail.plist"
    
    setopt Err_Exit
   
	   
    for I in				    \
	"fetchmail +fetchmailconf+ssl+ntml" \
	"imapfilter"
    do
	Install_Update ${I} ${=General_Variants}
    done; unset I

    #launchctl load -w "/Library/LaunchDaemons/com.krischik.fetchmail.plist"
    #port load fetchmail

    Select_System
    Clean
else
    setopt Multi_OS
    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
