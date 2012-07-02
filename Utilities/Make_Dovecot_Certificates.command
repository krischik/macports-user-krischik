#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author$
#   $Revision$
#   $Date$
#   $HeadURL$
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
