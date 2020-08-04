#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 143895 $
#   $Date: 2015-12-25 08:11:12 +0100 (Fr, 25. Dez 2015) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/Utilities/Install_Mobile_Development.command $
############################################################## }}}1 ##########

source ${0:h}/Setup.command

setopt No_XTrace
setopt Err_Exit

if test "${USER}" = "root"; then
    for I in			    \
	"nodejs14"		    \
	"npm6"			    
    do
	Install_Update ${I} ${=General_Variants}
    done; unset I

    npm install --global downloadstation-cli
    npm install --global typescript
    npm install --global solc
    npm install --global firebase-tools
else
    setopt Multi_OS
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
