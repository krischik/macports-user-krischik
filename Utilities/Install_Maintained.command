#!/opt/local/bin/zsh

source ${0:h}/Setup.command

setopt No_X_Trace;
setopt No_Err_Exit;

if test "${USER}" = "root"; then
    port select gcc gcc42

    Update_Tree;
    Update_Packages;

    for I in					    \
	"atari800"				    \
	"free42"				    \
	"glassfishv3"				    \
	"derby-server"				    \
	"leafnode"				    \
	"nonpareil"				    \
	"nrg4iso"				    \
	"oorexx"				    \
	"sigil"					    ;
    do
	port install -f ${=I} ${=General_Variants}
    done; unset I

    port select gcc gnat-gcc42
else
    setopt Multi_OS;

    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out;
fi;

# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
