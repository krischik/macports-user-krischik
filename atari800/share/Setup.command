#!/bin/zsh
############################################################## {{{1 ##########
#   $Author$
#   $Revision$
#   $Date$
#   $HeadURL$
############################################################## }}}1 ##########

setopt Np_X_Trace;

local User_Data="${HOME}/Library/Application Support/Atari800"
local System_Data="@PREFIX@/share/atari800";

if test ! -d "${User_Data}"; then
    mkdir "${User_Data}";
fi;

for I in *.XFD *.ATR do
    if test ! -f "${User_Data}/${I}"; then
	cp "${System_Data}/${I}" "${User_Data}/${I}";
    fi;
done; unset I

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
