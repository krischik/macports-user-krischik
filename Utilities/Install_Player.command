#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 143895 $
#   $Date: 2015-12-25 08:11:12 +0100 (Fr, 25. Dez 2015) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/Utilities/Install_Player.command $
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
	"opencv"								\
	"ffmpeg +nonfree+gpl2+mmx"						\
	"libogg"								\
	"exif"									\
	"exiftags"								\
	"flac"									\
	"poppler"								\
	"MPlayer +aa+caca+dts+mencoder_extras+esd+fribidi+live+osd+sdl+speex"	\
	"sox"									\
	"avidemux +aac+dts+esd+jack+lame+ogg+x264+xvid"				\
	"VLC +huge"
    do
	Install_Update ${=I} "${General_Variants}"
    done; unset I


    sudo port -f deactivate cryptlib
    # rm    ~"/Library/Preference/org.videolan.vlc.LSSharedFileList.plist"
    # rm -r ~"/Library/Application Support/org.videolan.vlc"
    # rm -r ~"/Library/Caches/org.videolan.vlc"
    # rm -r ~"/Library/Preference/org.videolan.vlc"
    # rm -r ~"/Library/Saved Application State/org.videolan.vlc.savedState"

    Load_System
    Select_System
    Clean
else
    setopt Multi_OS

    Unload_User
    sudo ${0:a} ${USER} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out
    Load_User
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
