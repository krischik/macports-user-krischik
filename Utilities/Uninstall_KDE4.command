#!/opt/local/bin/zsh

setopt X_Trace;

if test "${USER}" = "root"; then
    Unload_System;

    for I in		    \
	"kdeadmin4"	    \
	"kdeartwork4"	    \
	"kdebase4"	    \
	"kdegames4"	    \
	"kdegraphics4"	    \
	"kdelibs4"	    \
	"kdemultimedia4"    \
	"kdepim4"	    \
	"kdepimlibs4"	    \
	"kdesdk4"	    \
	"kdesupport4"	    \
	"kdeutils4"	    ;
    do
	port uninstall --follow-dependents ${=I}
    done; unset I

    Load_System;
else
    setopt Multi_OS;

    Unload_User;
    sudo ${0} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out;
    Load_User;
fi;

# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :