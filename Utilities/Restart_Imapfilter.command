#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 97540 $
#   $Date: 2012-09-08 14:39:54 +0200 (Sa, 08. Sep 2012) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/Utilities/Restart_Imapfilter.command $
############################################################## }}}1 ##########

setopt No_X_Trace
setopt No_Err_Exit

launchctl stop         com.krischik.imapfilter
launchctl unload -w    "${HOME}/Library/LaunchAgents/com.krischik.imapfilter.plist"
launchctl load   -w    "${HOME}/Library/LaunchAgents/com.krischik.imapfilter.plist"
launchctl start        com.krischik.imapfilter

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 expandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
