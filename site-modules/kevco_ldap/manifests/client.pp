class kevco_ldap::client (
  $base_dn,
  $server_uris,
  $tls_cacert    = undef,
  $tls_cacertdir = undef,
) {
  class { 'openldap::client':
    base          => $base_dn,
    uri           => $uris,
    tls_cacert    => $tls_cacert,
    tls_cacertdir => $tls_cacertdir,
  }
}
