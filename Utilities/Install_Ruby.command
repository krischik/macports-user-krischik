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

function Install_GEM ()
{
    local in_GEM="${1}"

    ${in_GEM} install bundler
    ${in_GEM} install colorize
    ${in_GEM} install contracts
    ${in_GEM} install gems
    ${in_GEM} install ruby-debug-ide
    ${in_GEM} install rubygems-update
    ${in_GEM} install fastlane
    ${in_GEM} install steem-ruby
    ${in_GEM} install radiator
    ${in_GEM} install cocoapods
}

if test "${USER}" = "root"; then
    for I in				\
	"ruby25"			\
	"ruby26"
	"ruby27"
    do
	Install_Update ${I} +gmp ${=General_Variants}
    done; unset I

    port select --set "ruby" "ruby27"

    Install_GEM "/opt/local/bin/gem2.7"

    update_rubygems
else
    setopt Multi_OS

fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
