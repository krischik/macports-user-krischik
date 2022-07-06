#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 133186 $
#   $Date: 2015-02-23 14:59:43 +0100 (Mo, 23. Feb 2015) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/Utilities/Update.command $
############################################################## }}}1 ##########

source ${0:a:h}/Setup.command

setopt No_XTrace
setopt Err_Exit

pushd "/Work/MacPorts"
    pushd "dports"
	# get current version regardsless of branch
	#
	git fetch --all --prune
	git fetch --all --prune --tags

	# update local master branch
	#
	git checkout master
	git pull

	# update local develop branch
	#
	git checkout develop
	git pull
	git merge master
    popd
    pushd "krischik"
	git fetch --all --prune
	git fetch --all --prune --tags
    popd
popd


############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
