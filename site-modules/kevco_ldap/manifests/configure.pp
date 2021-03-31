# Configures slapd
class kevco_ldap::configure (
  $ca_cert_name  = undef,
  $cert_name     = undef,
  $cert_key_name = undef,
){

  file { '/etc/openldap/certs':
    ensure  => directory,
    require => Package['openldap-servers'],
  }

  file { '/etc/openldap/cacerts':
    ensure  => directory,
    require => Package['openldap-servers'],
  }

  # Upload CA cert
  file { "/etc/openldap/cacerts/${ca_cert_name}":
    ensure  => file,
    source  => "puppet:///prod_files/kevco_ldap/${ca_cert_name}",
    owner   => 'root',
    group   => 'ldap',
    mode    => '0640',
    require => File['/etc/openldap/cacerts'],
  }

  # Upload ldaps cert
  file { "/etc/openldap/certs/${cert_name}":
    ensure  => file,
    source  => "puppet:///prod_files/kevco_ldap/${cert_name}",
    owner   => 'root',
    group   => 'ldap',
    mode    => '0640',
    require => File['/etc/openldap/certs'],
  }

  # Upload ldaps key
  file { "/etc/openldap/certs/${cert_key_name}":
    ensure  => file,
    source  => "puppet:///prod_files/kevco_ldap/${cert_key_name}",
    owner   => 'root',
    group   => 'ldap',
    mode    => '0640',
    require => File['/etc/openldap/certs'],
  }->
  # Set up ldaps
  class { 'openldap::server':
    ldap_ifs  => ["${facts['networking']['interfaces']['eth0']['ip']}:389/"],
    ldaps_ifs => ["${facts['networking']['interfaces']['eth0']['ip']}:636/"],
    ssl_cert  => "/etc/openldap/certs/${cert_name}",
    ssl_key   => "/etc/openldap/certs/${cert_key_name}",
  }
  #class { '::openldap::utils': }

  package { 'perl-Archive-Zip':
    ensure => installed,
  }

  # Delete deprecated hdb
  openldap::server::database { 'dc=my-domain,dc=com':
    ensure => absent,
  }

  firewalld_port { 'ldap port':
    ensure   => present,
    port     => 389,
    protocol => 'tcp',
  }

  firewalld_port { 'ldaps port':
    ensure   => present,
    port     => 636,
    protocol => 'tcp',
  }
}
