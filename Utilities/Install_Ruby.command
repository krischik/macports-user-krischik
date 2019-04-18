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
    for I in				\
	"ruby25 +gmp"			\
	"ruby26 +gmp"
    do
	Install_Update ${I} ${=General_Variants}
    done; unset I

    port select --set "ruby" "ruby26"

    gem install bundler
    gem install colorize
    gem install contracts
    gem install gems
    gem install ruby-debug-ide
    gem install fastlane
else
    setopt Multi_OS
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
