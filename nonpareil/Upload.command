#!/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 47817 $
#   $Date: 2009-03-07 11:23:54 +0100 (Sa, 07 Mär 2009) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/nonpareil/appbundles/HP-41CX.app/Contents/MacOS/HP-41CX.command $
############################################################## }}}1 ##########

typeset in_Version=${1}

pushd "/var/tmp"
    mkdir "nonpareil"
    pushd "nonpareil"
	svn 
    popd;    
popd;

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
