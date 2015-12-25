#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author$
#   $Revision$
#   $Date$
#   $HeadURL$
############################################################## }}}1 ##########

source ${0:h}/Setup.command

setopt No_XTrace
setopt No_Err_Exit

if test "${USER}" = "root"; then
    Deselect_System
    Update_Tree
    Update_Packages

    for I in					    \
	"atari800"				    \
	"free42"				    \
	"glassfishv3"				    \
	"derby-server"				    \
	"leafnode"				    \
	"nonpareil"				    \
	"nrg4iso"				    \
	"oorexx"				    \
	"sigil"
    do
	port install -f ${=I} ${=General_Variants}
    done; unset I

    Select_System
    Clean
else
    setopt Multi_OS

    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
