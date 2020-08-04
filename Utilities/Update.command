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

if test "${USER}" = "root"; then
    #Unload_System

    port select --set gcc llvm-gcc6

    Update_Tree
    Update_Packages

    gem update $(gem list | cut -d ' ' -f 1) --verbose

    # gem install rubygems-update
    # update_rubygems
    gem update --system

    Clean
    Load_System
else
    setopt Multi_OS

    Unload_User

    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out

    brew update
    brew upgrade

    path=(/usr/local/opt/ruby/bin ${path})

    gem update --system
    gem update $(gem list | cut -d ' ' -f 1) --verbose

    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out

    Load_User
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
