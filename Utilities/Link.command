#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 94920 $
#   $Date: 2012-07-02 14:29:54 +0200 (Mo, 02. Jul 2012) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/Utilities/Load.command $
############################################################## }}}1 ##########

source ${0:h}/Setup.command

setopt No_X_Trace
setopt Err_Exit

if test "${USER}" = "root"; then
    sudo gchown -R ${1} ~/Library/Preferences/KDE

    pushd "/Applications/Calculator.localized"
	ln -s "../MacPorts/Nonpareil/"*.app "." 
    popd
else
    setopt Multi_OS

    sudo ${0:a} ${USER} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
