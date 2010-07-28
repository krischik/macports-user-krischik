#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 52694 $
#   $Date: 2009-06-21 20:48:35 +0200 (So, 21. Jun 2009) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/atari800/Upload.command $
############################################################## }}}1 ##########

setopt X_Trace;

# Generates a self-signed certificate.
# Edit dovecot-openssl.cnf before running this.

OPENSSL=${OPENSSL-openssl}
SSLDIR=${SSLDIR-/opt/local/etc/ssl}
OPENSSLCONFIG=${OPENSSLCONFIG-dovecot-openssl.cnf}

CERTFILE=$SSLDIR/certs/dovecot.pem
KEYFILE=$SSLDIR/private/dovecot.pem

if [ ! -d $SSLDIR/certs ]; then
  echo "$SSLDIR/certs directory doesn't exist"
fi

if [ ! -d $SSLDIR/private ]; then
  echo "$SSLDIR/private directory doesn't exist"
fi

if [ -f $CERTFILE ]; then
  echo "$CERTFILE already exists, won't overwrite"
  exit 1
fi

if [ -f $KEYFILE ]; then
  echo "$KEYFILE already exists, won't overwrite"
  exit 1
fi

$OPENSSL req -new -x509 -nodes -config $OPENSSLCONFIG -out $CERTFILE -keyout $KEYFILE -days 3650 || exit 2
chmod 0600 $KEYFILE
echo 
$OPENSSL x509 -subject -fingerprint -noout -in $CERTFILE || exit 2

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
