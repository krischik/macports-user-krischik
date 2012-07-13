#!/opt/local/bin/zsh

setopt Err_Exit
setopt X_Trace

if test "${USER}" = "root"; then
    typeset prefix='/opt/local'
    typeset bootprefix='/opt/gcc-4.5.0-x86_64'

    #typeset -x -g AR_FOR_TARGET="/usr/bin/ar"
    #typeset -x -g AS_FOR_TARGET="/usr/bin/as"
    #typeset -x -g LD_FOR_TARGET="/usr/bin/ld"
    #typeset -x -g NM_FOR_TARGET="/usr/bin/nm"
    #typeset -x -g OBJDUMP_FOR_TARGET="/usr/bin/objdump"
    #typeset -x -g RANLIB_FOR_TARGET="/usr/bin/ranlib"
    #typeset -x -g STRIP_FOR_TARGET="/usr/bin/strip"

    typeset -x -g AR_FOR_TARGET="/opt/local/bin/ar"
    typeset -x -g AS_FOR_TARGET="/opt/local/bin/as"
    typeset -x -g LD_FOR_TARGET="/opt/local/bin/ld"
    typeset -x -g NM_FOR_TARGET="/opt/local/bin/nm"
    typeset -x -g OBJDUMP_FOR_TARGET="/opt/local/bin/objdump"
    typeset -x -g RANLIB_FOR_TARGET="/opt/local/bin/ranlib"
    typeset -x -g STRIP_FOR_TARGET="/opt/local/bin/strip"

    typeset -x -g CC="${bootprefix}/bin/gcc"
    typeset -x -g CPP="${bootprefix}/bin/cpp"
    typeset -x -g GNATBIND="${bootprefix}/bin/gnatbind"
    typeset -x -g GNATMAKE="${bootprefix}/bin/gnatmake"
    typeset -x -g OBJC="${bootprefix}/bin/gcc"

    typeset -x -g CPPFLAGS="-I${bootprefix}/include -I${prefix}/include"
    typeset -x -g CXX="${bootprefix}/bin/g++"
    typeset -x -g CXXCPP="${bootprefix}/bin/cpp"

    #typeset -x -g CFLAGS="-O2"
    #typeset -x -g CXXFLAGS="-O2"
    #typeset -x -g F90FLAGS="-O2"
    #typeset -x -g FCFLAGS="-O2"
    #typeset -x -g FFLAGS="-O2"
    #typeset -x -g OBJCFLAGS="-O2"

    typeset -x -g INSTALL="/usr/bin/install -c"
    typeset -x -g LDFLAGS="-L${prefix}/lib"
    typeset -x -g MACOSX_DEPLOYMENT_TARGET="10.6"
    typeset -x -g PATH="${bootprefix}/bin:${prefix}/bin:${prefix}/sbin:/bin:/sbin:/usr/bin:/usr/sbin"

    pushd "work/build"
	if test -e makefile; then
	    gnice make distclean
	fi;

	gnice ../gcc-4.5.2/configure					    \
	    --prefix=${prefix}						    \
	    --build=x86_64-apple-darwin10				    \
	    --enable-languages=c,ada,c++,fortran			    \
	    --libdir=${prefix}/lib/gnat-gcc				    \
	    --includedir=${prefix}/include/gnat-gcc			    \
	    --infodir=${prefix}/share/info				    \
	    --mandir=${prefix}/share/man				    \
	    --datarootdir=${prefix}/share/gcc-4.5			    \
	    --with-local-prefix=${prefix}				    \
	    --with-system-zlib						    \
	    --program-suffix=-gnat-4.5					    \
	    --with-gxx-include-dir=${prefix}/include/gnat-gcc/c++/	    \
	    --with-gmp=${prefix}					    \
	    --with-mpfr=${prefix}					    \
	    --with-mpc==${prefix}					    

#../gcc-trunk-svn/configure --prefix=/opt/gcc-4.6.0-x86_64 \
#--disable-multilib --enable-languages=c,ada,c++,fortran \
#--with-gmp=/opt/gnu --with-mpfr=/opt/gnu --with-mpc=/opt/gnu \
#--build=x86_64-apple-darwin10 --disable-bootstrap

	gnice make
    popd
else
    setopt Multi_OS

    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out
fi

# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
