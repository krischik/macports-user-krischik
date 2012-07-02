#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author$
#   $Revision$
#   $Date$
#   $HeadURL$
############################################################## }}}1 ##########

source ${0:h}/Setup.command

setopt No_X_Trace
setopt No_Err_Exit

if test "${USER}" = "root"; then
    Unload_System

    port select gcc gcc42

    Update_Tree
    Update_Packages

    for I in									\
	"poppler"
    do
	Install_Update ${=I} "${General_Variants}"
    done; unset I
    
    for I in									\
	"MPlayer +aa+caca+dts+mencoder_extras+esd+fribidi+live+osd+sdl+speex"   \
	"avidemux +aac+dts+esd+jack+lame+ogg+x264+xvid"				\
	"VLC +huge+qt4"
    do
	Install_Update ${=I} "${Qt_Variants}${General_Variants}"
    done; unset I

    port select gcc gnat-gcc42
    
    sudo gchown -R ${1} ~/Library/Preferences/KDE

    Clean;
    Load_System
else
    setopt Multi_OS
    
    Unload_User
    sudo ${0:a} ${USER} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out
    Load_User
fi

# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
