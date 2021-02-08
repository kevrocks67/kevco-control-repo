# Upload new schemas to server
class kevco_ldap::schemas::upload {
  # Fix posixGroup attribute (Change STRUCTURAL to AUXILIARY)
  file { '/etc/openldap/schema/nis.ldif':
    replace => true,
    source  => 'puppet:///modules/kevco_ldap/nis.ldif',
  }

  # Upload sudo schema
  file { '/etc/openldap/schema/sudo.ldif':
    ensure => file,
    source => 'puppet:///modules/kevco_ldap/sudo.ldif',
    owner  => 'root',
    group  => 'ldap',
    mode   => '0640',
  }
  
  # Upload kerberos schema
  file { '/etc/openldap/schema/kerberos.ldif':
    ensure => file,
    source => 'puppet:///modules/kevco_ldap/kerberos.ldif',
    owner  => 'root',
    group  => 'ldap',
    mode   => '0640',
  }
}
