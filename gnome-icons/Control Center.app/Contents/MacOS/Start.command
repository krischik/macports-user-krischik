#!/bin/zsh
############################################################## {{{1 ##########
#   $Author$
#   $Revision$
#   $Date$
#   $HeadURL$
############################################################## }}}1 ##########

path=(/opt/local/sbin ${path})
path=(/opt/local/bin ${path})

#@PREFIX@/bin/gnome-control-center &
/opt/local/bin/gnome-control-center &

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :

