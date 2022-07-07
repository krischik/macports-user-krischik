#!/bin/zsh
############################################################## {{{1 ##########
#   Copyright © 2005 … 2020  Martin Krischik
############################################################################
#   This program is free software; you can redistribute it and/or
#   modify it under the terms of the GNU General Public License
#   as published by the Free Software Foundation; either version 2
#   of the License, or (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
############################################################## }}}1 ##########

local User_Data="${HOME}/Library/Application Support/Atari800"
local System_Data="@PREFIX@/share/atari800"

${System_Data}/Setup.command

@PREFIX@/bin/atari800					\
    -1400						\
    -autosave-config					\
    -bilinear-filter					\
    -bpp	    0					\
    -horiz-area	    tv					\
    -nobasic						\
    -pal						\
    -pbo						\
    -pixel-format   argb32				\
    -showspeed						\
    -stretch	    5					\
    -vertical-area  tv					\
    -video-accel					\
    -win-height	    1120				\
    -win-width	    1680				\
    -windowed						\
    -config    "${User_Data}//Atari-1400XL-MyDos.cfg"	\
    -basic_rom "${System_Data}/ATARIBAS.ROM"		\
    -osb_rom   "${System_Data}/ATARIOSB.ROM"		\
    -xlxe_rom  "${System_Data}/ATARIXL.ROM"		\
    ${User_Data}/MYDOS45D.XFD

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
