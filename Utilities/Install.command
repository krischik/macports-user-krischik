#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author$
#   $Revision$
#   $Date$
#   $HeadURL$
############################################################## }}}1 ##########

source ${0:h}/Setup.command

setopt No_X_Trace;
setopt No_Err_Exit;

if test "${USER}" = "root"; then
    port select gcc gcc42

    Update_Tree;
    Update_Packages;

    for I in									\
	"acl2"									\
	"aspell +nls"								\
	"aspell-dict-de"							\
	"aspell-dict-en"							\
	"aspell-dict-ru"							\
	"autoconf"								\
	"b5i2iso"								\
	"bison +yacc"								\
	"bitstream-vera"							\
	"bzip2"									\
	"coreutils"								\
	"ctags"									\
	"dbacl"									\
	"dbus"									\
	"diffutils"								\
	"dos2unix"								\
	"dos2unix"								\
	"enchant"								\
	"file +with_text_magic_file"						\
	"findutils"								\
	"flex"									\
	"fontconfig +vera"							\
	"giflib"								\
	"gmp"									\
	"gnupg"									\
	"gnutar"								\
	"gsed"									\
	"gwhich"								\
	"gzip +rsyncable"							\
	"hunspell"								\
	"hunspell-dict-de_DE"							\
	"jasper +jiv"								\
	"jpeg"									\
	"liblzma"								\
	"libpng"								\
	"lzma"									\
	"lzmautils"								\
	"m4"									\
	"mdf2iso"								\
	"mpfr"									\
	"nrg2iso"								\
	"p7zip"									\
	"pdi2iso"								\
	"png2ico"								\
	"rb-termios"								\
	"readline"								\
	"rsync +rsyncd"								\
	"shared-mime-info"							\
	"sitecopy"								\
	"spellutils"								\
	"star"									\
	"texinfo"								\
	"tiff"									\
	"uif2iso"								\
	"urw-fonts"								\
	"wget +ssl"								\
	"wput +ssl"								\
	"xpm"									\
	"transmission-x11 +aqua"						\
	"fontforge +freetype_bytecode"						\
	"ImageMagick +graphviz+gs+hdri+jbig+jpeg2+lcms+lqr+mpeg+perl+rsvg+wmf"	;
    do
	Install_Update ${=I} "${General_Variants}"
    done; unset I

    for I in		\
	"avahi +mono"	\
	"fugu"
    do
	Install_Update ${=I} 
    done; unset I

    Clean;

    port select gcc gnat-gcc42
else
    setopt Multi_OS;

    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out;
fi;

# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
