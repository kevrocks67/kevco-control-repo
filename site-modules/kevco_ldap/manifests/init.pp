# Deploys openldap master config
class kevco_ldap (
  $db_dir,
  $db_suffix,
  $root_dn,
  $root_pw,
  $server_role              = 'master',
  $accesslog_root_pw        = undef,
  $accesslog_db_max_size    = '10485760',
  $ca_cert_name             = undef,
  $cert_name                = undef,
  $cert_key_name            = undef,
  $db_max_size              = '10485760',
  $sync_rid                 = undef,
  $sync_provider            = undef,
  $sync_type                = undef,
  $sync_retry               = undef,
  $sync_schema_check        = undef,
  $sync_bind_method         = undef,
  $sync_bind_dn             = undef,
  $sync_bind_creds          = undef,
  $sync_searchbase          = undef,
  $sync_tls_reqcert         = undef,
  $sync_tls_cert            = undef,
  $sync_tls_key             = undef,
  $sync_mirror_mode         = undef,
) {
  class{ 'kevco_ldap::configure': 
    ca_cert_name  => $ca_cert_name,
    cert_name     => $cert_name,
    cert_key_name => $cert_key_name,
  }->
  class{ 'kevco_ldap::schemas::upload': }->
  class{ 'kevco_ldap::schemas::install': }->
  class{ 'kevco_ldap::db': 
    db_dir                  => $db_dir,
    db_max_size             => $db_max_size,
    db_suffix               => $db_suffix,
    root_dn                 => $root_dn,
    root_pw                 => $root_pw,
    sync_rid                => $sync_rid,
    sync_provider           => $sync_provider,
    sync_type               => $sync_type,
    sync_retry              => $sync_retry,
    sync_schema_check       => $sync_schema_check, 
    sync_bind_method        => $sync_bind_method,
    sync_bind_dn            => $sync_bind_dn,
    sync_bind_creds         => $sync_bind_creds,
    sync_searchbase         => $sync_searchbase,
    sync_tls_reqcert        => $sync_tls_reqcert, 
    sync_tls_cert           => $sync_tls_cert,       
    sync_tls_key            => $sync_tls_key,          
    sync_mirror_mode        => $sync_mirror_mode,
  }->
  class{ 'kevco_ldap::overlays::enable': }->
  class{ 'kevco_ldap::overlays::configure': 
    accesslog_root_pw     => $accesslog_root_pw,
    accesslog_db_max_size => $accesslog_db_max_size,
    db_suffix             => $db_suffix,
    server_role           => $server_role,
  } 
}
