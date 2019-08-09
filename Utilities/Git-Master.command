#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 97540 $
#   $Date: 2012-09-08 14:39:54 +0200 (Sa, 08. Sep 2012) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/Utilities/Clean.command $
############################################################## }}}1 ##########

source ${0:h}/Setup.command

setopt No_XTrace
setopt No_Err_Exit

pushd ${Base_Work_Dir}
    git checkout master
    git pull upstream master
    git push origin
popd

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
