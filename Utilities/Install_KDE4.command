#!/opt/local/bin/zsh

source ${0:h}/Setup.command

setopt No_X_Trace;
setopt No_Err_Exit;

if test "${USER}" = "root"; then
    Unload_System;

    gcc_select gcc42;

    No_Universal;
    Update;
    Force_Activate;

    port clean all;
    port upgrade python25
    port -p deactivate kdelibs3 kdelibs4 libevent

    for I in					\
	"qt4-mac ${General_Variants}"		\
	"akonadi +docs${General_Variants}"	\
	"kdelibs4 +docs"			\
	"kdebase4 +docs"			\
	"kdeutils4 +docs"			\
	"kdepim4 +docs"				\
	"kdemultimedia4 +docs"			\
	"kdegraphics4 +docs"			\
	"kdegames4 +docs"			\
	"VLC +huge+qt4"				;
    do
	Install_Update ${=I} ${=Qt_Variants}
    done; unset I

    gcc_select gnat-gcc
    
    sudo gchown -R ${1} ~/Library/Preferences/KDE

    #Clean;
    Load_System;
else
    setopt Multi_OS;
    
    Unload_User;
    sudo ${0:a} ${USER} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out;
    Load_User;
fi;

# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
