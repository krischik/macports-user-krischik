#!/bin/zsh
############################################################## {{{1 ##########
#   $Author$
#   $Revision$
#   $Date$
#   $HeadURL$
############################################################# }}}1 ##########

local User_Data="${HOME}/Library/Application Support/Atari800"
local System_Data="@PREFIX@/share/atari800";

${System_Data}/Setup.command

@PREFIX@/bin/atari800				\
    -320xe					\
    -basic					\
    -pal					\
    -video-accel				\
    -windowed					\
    -win-width 2048				\
    -win-height 1152				\
    -bpp 0					\
    -xlxe_rom "${System_Data}/ATARIXL.ROM"	\
    -basic_rom "${System_Data}/ATARIBAS.ROM"	\
    ${User_Data}/Sparta32g.XFD			;

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
