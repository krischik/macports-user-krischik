#!/bin/zsh
############################################################## {{{1 ##########
#   $Author$
#   $Revision$
#   $Date$
#   $HeadURL$
############################################################## }}}1 ##########

local User_Data="${HOME}/Library/Application Support/Atari800"
local System_Data="/opt/local/share/atari800";

if test ! -d "${User_Data}"; then
    mkdir "${User_Data}";
fi;

for I in	    \
    "DEMOS1.XFD	    \
    "DEMOS2.XFD	    \
    "DOS25.XFD	    \
    "MYDOS45D.ATR
do
    if test ! -f "${User_Data}/${I}"; then
	cp					\
	    "/opt/local/share/atari800/${I}"	\
	    "${User_Data}/${I}"			;
    fi;
done; unset I

/opt/local/bin/atari800				\
    -320xe					\
    -pal					\
    -windowed					\
    -width 1280					\
    -height 960					\
    -bpp 16					\
    -xlxe_rom "${System_Data}/ATARIXL.ROM"	\
    ${User_Data}/MYDOS45D.ATR			;

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :