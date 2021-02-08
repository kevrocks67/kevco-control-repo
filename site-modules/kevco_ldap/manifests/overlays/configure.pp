# Configure overlays
class kevco_ldap::overlays::configure (
  $db_suffix,
  $server_role,
  $accesslog_root_pw,
  $accesslog_db_max_size = '10485760',
){
  openldap::server::overlay { "memberof on ${db_suffix}":
    ensure  => present,
    options => {
      'olcMemberOfRefInt'     => 'TRUE',
      'olcMemberOfDangling'   => 'ignore',
      'olcMemberOfGroupOC'    => 'groupOfNames',
      'olcMemberOfMemberAD'   => 'member',
      'olcMemberOfMemberOfAD' => 'memberOf',
    },
  }->
  
  openldap::server::overlay { "auditlog on ${db_suffix}":
    ensure  => present,
    options => {
      'olcAuditlogFile' => '/var/lib/ldap/auditlog.ldif',
    },
  }->

  openldap::server::database { 'cn=accesslog':
    ensure     => present,
    directory  => '/var/lib/ldap/accesslog',
    backend    => 'mdb',
    initdb     => false,
    rootdn     => 'cn=admin,cn=accesslog',
    rootpw     => $accesslog_root_pw,
    suffix     => 'cn=accesslog',
    dbmaxsize  => $accesslog_db_max_size,
    dboptions  => {
      'index' => [
        'default eq',
        'entryCSN,entryUUID eq',
        'objectClass,reqStart,reqEnd,reqResult eq,pres',
      ],
    },
  }->

  # Configure accesslog
  openldap::server::overlay { "accesslog on ${db_suffix}":
    ensure  => present,
    options => {
      'olcAccessLogDB'      => 'cn=accesslog',
      'olcAccessLogOps'     => 'all',
      'olcAccessLogSuccess' => 'TRUE',
      'olcAccessLogPurge'   => '30+00:00 01+00:00',
    },
  }
 
  if $server_role == "master" {
    # Configure syncprov master
    openldap::server::overlay { "syncprov on ${db_suffix}":
      ensure  => present,
      options =>  {
        'olcSpCheckpoint' => '100 10',
        'olcSpSessionlog' => '100',
        #'olcSpNoPresent'  => 'TRUE',
      },
    }
  }
}
