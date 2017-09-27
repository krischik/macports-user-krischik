#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 133186 $
#   $Date: 2015-02-23 14:59:43 +0100 (Mo, 23. Feb 2015) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/Utilities/Update.command $
############################################################## }}}1 ##########

source ${0:a:h}/Setup.command

setopt No_XTrace
setopt No_Err_Exit

pushd "/Work/MacPorts/dports"
    # git remote add upstream https://github.com/macports/macports-ports
    # git pull "https://github.com/krischik/macports-ports"
    # git pull "https://github.com/macports/macports-ports"
    git fetch --all
    git checkout -b Pick8aa6096875 upstream/master
    git cherry-pick 8aa6096875
    git push -u origin Pick8aa6096875
    git checkout master  
popd

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
