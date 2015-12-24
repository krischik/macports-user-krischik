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
    Unload_System
    Update_Tree
    Update_Packages

    for I in									\
	"ffmpeg +nonfree+gpl2+mmx+universal"					\
	"libogg"								\
	"flac"									\
	"poppler"								\
	"MPlayer +aa+caca+dts+mencoder_extras+esd+fribidi+live+osd+sdl+speex"	\
	"sox"									\
	"avidemux +aac+dts+esd+jack+lame+ogg+x264+xvid"
    do
	Install_Update ${=I} "${General_Variants}"
    done; unset I

    for I in			\
	"qt4-mac"		\
	"qt4_select"		\
	"MP4Joiner"		\
	"VLC +huge+qt4"
    do
	Install_Update ${=I} "${Qt_Variants}${General_Variants}"
    done; unset I;

    # rm    ~"/Library/Preference/org.videolan.vlc.LSSharedFileList.plist"
    # rm -r ~"/Library/Application Support/org.videolan.vlc"
    # rm -r ~"/Library/Caches/org.videolan.vlc"
    # rm -r ~"/Library/Preference/org.videolan.vlc"
    # rm -r ~"/Library/Saved Application State/org.videolan.vlc.savedState"

    Clean
    Load_System
    Select_System
else
    setopt Multi_OS

    Unload_User
    sudo ${0:a} ${USER} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out
    Load_User
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
