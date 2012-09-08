#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author$
#   $Revision$
#   $Date$
#   $HeadURL$
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
