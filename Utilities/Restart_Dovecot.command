#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 52694 $
#   $Date: 2009-06-21 20:48:35 +0200 (So, 21. Jun 2009) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/atari800/Upload.command $
############################################################## }}}1 ##########

setopt X_Trace;
setopt No_Err_Exit;

if test "${USER}" = "root"; then
    launchctl unload -w /Library/LaunchDaemons/org.macports.dovecot.plist
    launchctl unload -w /Library/LaunchDaemons/org.macports.slapd.plist
    launchctl load   -w /Library/LaunchDaemons/org.macports.slapd.plist
    launchctl load   -w /Library/LaunchDaemons/org.macports.dovecot.plist
else
    setopt Multi_OS;

    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out;
fi;

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
