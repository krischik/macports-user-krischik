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
    for I in			    \
	"perl5+perl5_28"	    \
	"perl5.28"		    
    do
	Install_Update ${I} ${=General_Variants}
    done; unset I

    for I in			    \
	"p5.28-common-sense"	    \
	"p5.28-data-dumper"	    \
	"p5.28-json"		    \
	"p5.28-json-parse"	    \
	"p5.28-json-xs"		    \
	"p5.28-libwww-perl"	    \
	"p5.28-types-serialiser"    \
	"p5.28-xml-libxml"	    \
	"p5.28-xml-parser"	    \
	"p5.28-xml-parser-easytree" \
	"p5.28-xml-writer"	    \
	"p5.28-xml-writer-string"   \
	"perl_select"
    do
	Install_Update ${I} ${=General_Variants}
    done; unset I
else
    setopt Multi_OS

    brew install perl

    cpan Log::Log4perl
    cpan XML::Parser
    cpan XML::Parser::EasyTree
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
