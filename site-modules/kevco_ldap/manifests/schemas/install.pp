# Install new schemas on server
class kevco_ldap::schemas::install {
  openldap::server::schema { 'cosine':
    ensure => present,
    path   => '/etc/openldap/schema/cosine.ldif',
  }
  
  openldap::server::schema { 'inetorgperson':
    ensure  => present,
    path    => '/etc/openldap/schema/inetorgperson.ldif',
    require => Openldap::Server::Schema['cosine'],
  }
  
  openldap::server::schema { 'nis':
    ensure  => present,
    path    => '/etc/openldap/schema/nis.ldif',
    require => Openldap::Server::Schema['inetorgperson'],
  }
  
  openldap::server::schema { 'sudo':
    ensure  => present,
    path    => '/etc/openldap/schema/sudo.ldif',
    require => Openldap::Server::Schema['nis'],
  }
  
  openldap::server::schema { 'kerberos':
    ensure  => present,
    path    => '/etc/openldap/schema/kerberos.ldif',
    require => Openldap::Server::Schema['sudo'],
  }
}
