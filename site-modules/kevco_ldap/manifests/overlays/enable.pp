# Enable overlays
class kevco_ldap::overlays::enable {
  openldap::server::module { 'memberof':
    ensure  => present,
  }->
  
  openldap::server::module { 'refint':
    ensure => present,
  }
  
  openldap::server::module { 'dynlist':
    ensure => present,
  }
  
  openldap::server::module { 'accesslog':
    ensure => present,
  }
  
  openldap::server::module { 'auditlog':
    ensure => present,
  }
  
  openldap::server::module { 'syncprov':
    ensure => present,
  }
}
