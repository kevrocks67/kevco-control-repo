class profile::kevco_ldap::client {
  class{ 'kevco_ldap::client':
    base_dn       => lookup('profile::kevco_ldap::client::base_dn'), 
    server_uris   => lookup('profile::kevco_ldap::client::server_uris'), 
    tls_cacert    => lookup('profile::kevco_ldap::client::tls_cacert'), 
    tls_cacertdir => lookup('profile::kevco_ldap::client::tls_cacertdir'), 
  }
}
