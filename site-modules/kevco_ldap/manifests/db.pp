# Configure main db (mdb backend)
class kevco_ldap::db (
  $db_dir,
  $db_suffix,
  $root_dn,
  $root_pw,
  $sync_pw,
  $db_max_size,
  $read_only,
  $server_role,
  $sync_rid,
  $sync_provider,
  $sync_searchbase,
  $sync_type,
  $sync_retry,
  $sync_schema_check,
  $sync_bind_method,
  $sync_bind_dn,
  $sync_bind_creds,
  $sync_tls_reqcert,
  $sync_tls_cert,
  $sync_tls_key,
  $sync_mirror_mode,
) {
  if $server_role == 'slave' {
    $sync_conf = "rid=${sync_rid} provider=\"${sync_provider}\"
     searchbase=\"${sync_searchbase}\"
     type=${sync_type}
     retry=\"${sync_retry}\"
     schemachecking=${sync_schema_check}
     bindmethod=${sync_bind_method}
     binddn=\"${sync_bind_dn}\"
     credentials=${sync_bind_creds}
     tls_reqcert=${sync_tls_reqcert}
     tls_cert=${sync_tls_cert}
     tls_key=${sync_tls_key}"
  } else {
    $sync_conf = undef
  }

  openldap::server::database { $db_suffix:
    ensure    => present,
    directory => $db_dir,
    backend   => 'mdb',
    rootdn    => $root_dn,
    rootpw    => $root_pw,
    syncpw    => $sync_pw,
    suffix    => $db_suffix,
    readonly  => $read_only,
    dbmaxsize => $db_max_size,
    dboptions => {
      'index' => [
        'default eq',
        'krbPrincipalName eq',
        'entryCSN,entryUUID eq',
        'objectClass eq,pres',
        'ou,cn,mail,surname,givenname eq,pres,sub',
      ],
    },
    syncrepl  => $sync_conf,
  }
}
