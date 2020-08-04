#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 143895 $
#   $Date: 2015-12-25 08:11:12 +0100 (Fr, 25. Dez 2015) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/Utilities/Install_Mobile_Development.command $
############################################################## }}}1 ##########

source ${0:h}/Setup.command

setopt No_XTrace
setopt No_Err_Exit

if test "${USER}" = "root"; then
    Deselect_System
    Update_Tree
    Update_Packages
    ${0:h}/Install_Perl.command
    ${0:h}/Install_Ruby.command

    for I in			    \
	"android"		    \
	"ant-contrib"		    \
	"antenna"		    \
	"apache-ant"		    \
	"gradle"		    \
	"junit"			    \
	"kotlin"		    \
	"maven3"		    \
	"maven31"		    \
	"maven32"		    \
	"microemu"		    \
	"gmake +guile"		    \
	"mono"			    \
	"nodejs7"		    \
	"npm5"			    \
	"proguard"		    \
	"scala2.11"		    \
	"scala2.11-docs"	    \
	"scala2.12"		    \
	"scala2.12-docs"
    do
	Install_Update ${I} ${=General_Variants}
    done; unset I

    for I in			    \
	"maven_select"		    \
	"scala_select"
    do
	Install_Update ${I} ${=General_Variants}
    done; unset I

    npm -g install typescript
    npm -g install solc
    npm -g install appium --no-shrinkwrap

    Select_System
    Clean
else
    setopt Multi_OS
    # ${0:h}/Install_Perl.command
    # ${0:h}/Install_Ruby.command

    sudo ${0:a} >&1 2>&2 &>~/Library/Logs/${0:r:t}.out

    # brew tap facebook/fb
    # brew tap wix/brew

    # brew install carthage
    # brew install openssl
    # brew install npm
    # brew install cmake
    # brew install ffmpeg
    # brew install idb-companion
    # brew install applesimutils
    # brew install jenkins

    # brew cask install fastlane
    #brew link --force openssl

    # npm install --global appium
    # npm install --global appium-doctor
    # npm install --global mjpeg-consumer
    # npm install --global opencv4nodejs
    
    # pip3.7 install fb-id

fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
