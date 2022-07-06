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
    #Deselect_System
    ${0:h}/Install_Python.command
    ${0:h}/Install_Ruby.command
    ${0:h}/Install_Develop.command
    ${0:h}/Install_VCS.command

    # A python 3 is needed to compile
    #
    port select --set "python3" "python37"

    for I in					    \
	"docker +bash_completion+zsh_completion"    \
	"docker-compose"			    \
	"boost"					    \
	"cryptlib"				    \
	"libtool"				    \
	"openssl"				    \
	"secpwgen"				    \
        "berkeley-db"				    \
        "gperftools"
    do
	Install_Update ${I} ${=General_Variants}
    done; unset I

    port select --set "ruby" "ruby26"

    gem install steem-ruby
    gem install radiator

    #Select_System
    #Clean
else
    setopt Multi_OS
    ${0:h}/Install_Python.command
    ${0:h}/Install_Ruby.command
    
    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out

    # brew install homebrew/versions/boost160
    # brew update
    # brew upgrade
    # brew install boost cmake git openssl autoconf automake qt5
    # brew link --force openssl
    # brew install google-perftools
    # brew install berkeley-db
    # brew install libtool
    # brew install python3

    # typeset -x -g BOOST_ROOT="/usr/local/Cellar/boost@1.60/1.60.0"
    # typeset -x -g BOOST_LIBRARYDIR="${BOOST_ROOT}/lib"
    # typeset -x -g BOOST_INCLUDEDIR="${BOOST_ROOT}/include"

    # pushd "/Volumes/KINGSTON/Work/steemit"
	# if test -d "steem"; then
	    # git clone https://github.com/steemit/steem
	# fi
	   
	# pushd "steem"
	    # git fetch --all --tags --prune
	    # git checkout tags/v0.22.1
	    # git submodule update --init --recursive
	    # cmake -DCMAKE_BUILD_TYPE=Release -DENABLE_CONTENT_PATCHING=OFF -DLOW_MEMORY_NODE=ON
	    # make
	# popd
    # popd
    #
#https://www.investigationdiscovery.com/crimefeed/bad-behavior/christina-marie-curtis-daycare-worker-charged-4-toddlers-suffer-broken-legs
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
