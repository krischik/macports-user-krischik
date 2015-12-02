#!/bin/zsh
    ./Install_VCS.command*
############################################################## {{{1 ##########
#   $Author$
#   $Revision$
#   $Date$
#   $HeadURL$
############################################################## }}}1 ##########

source ${0:h}/Setup.command

setopt No_XTrace
setopt Multi_OS

sudo port install								    \
    "coreutils" ${=General_Variants}						    \
    "zsh" "+doc" "+mp_completion" ${=General_Variants}				    \
    "subversion" "+bash_completion" "+tools" "+unicode_path" ${=General_Variants}   \
    1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
