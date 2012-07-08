#!/opt/local/bin/zsh

############################################################## {{{1 ##########
#   $Author$
#   $Revision$
#   $Date$
#   $HeadURL$
############################################################## }}}1 ##########

source ${0:h}/Setup.command

setopt X_Trace
setopt No_Err_Exit

sendmail martin@macpro.local <<-EOF
Subject: Test Mail
From: root@macro.local
To: martin@macpro.local

Test Mail via sendmail

.
EOF

telnet macpro.local smtp <<-EOF
HELO macpro.local
MAIL FROM: root@macro.local
RCPT TO: martin@macpro.local
DATA
Subject: Test Mail
From: root@macro.local
To: martin@macpro.local

Test Mail via telnet

.

QUIT
EOF

# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
