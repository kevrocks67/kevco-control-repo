class profile::kevco_ldap::server {
  class{ 'kevco_ldap' :
    db_dir                => lookup('profile::kevco_ldap::server::db_dir'),
    db_suffix             => lookup('profile::kevco_ldap::server::db_suffix'),
    root_dn               => lookup('profile::kevco_ldap::server::root_dn'),
    root_pw               => lookup('profile::kevco_ldap::server::root_pw'),
    server_role           => lookup('profile::kevco_ldap::server::server_role'),
    ca_cert_name          => lookup('profile::kevco_ldap::server::ca_cert_name'),
    cert_name             => lookup('profile::kevco_ldap::server::cert_name'),
    cert_key_name         => lookup('profile::kevco_ldap::server::cert_key_name'),
    db_max_size           => lookup('profile::kevco_ldap::server::db_max_size', undef, undef, 10485760),
    read_only             => lookup('profile::kevco_ldap::server::read_only', undef, undef, false),
    accesslog_root_pw     => lookup('profile::kevco_ldap::server::accesslog_root_pw', undef, undef, undef),
    accesslog_db_max_size => lookup('profile::kevco_ldap::server::accesslog_db_max_size', undef, undef, 10485760),
    sync_rid              => lookup('profile::kevco_ldap::server::sync_rid', undef, undef, undef),
    sync_pw               => lookup('profile::kevco_ldap::server::sync_pw', undef, undef, undef),
    sync_provider         => lookup('profile::kevco_ldap::server::sync_provider', undef, undef, undef),
    sync_searchbase       => lookup('profile::kevco_ldap::server::sync_searchbase', undef, undef, undef),
    sync_type             => lookup('profile::kevco_ldap::server::sync_type', undef, undef, undef),
    sync_retry            => lookup('profile::kevco_ldap::server::sync_retry', undef, undef, undef),
    sync_schema_check     => lookup('profile::kevco_ldap::server::sync_schema_check', undef, undef, undef),
    sync_bind_method      => lookup('profile::kevco_ldap::server::sync_bind_method', undef, undef, undef),
    sync_bind_dn          => lookup('profile::kevco_ldap::server::sync_bind_dn', undef, undef, undef),
    sync_bind_creds       => lookup('profile::kevco_ldap::server::sync_bind_creds', undef, undef, undef),
    sync_tls_reqcert      => lookup('profile::kevco_ldap::server::sync_tls_reqcert', undef, undef, undef),
    sync_tls_cert         => lookup('profile::kevco_ldap::server::sync_tls_cert', undef, undef, undef),
    sync_tls_key          => lookup('profile::kevco_ldap::server::sync_tls_key', undef, undef, undef),
    sync_mirror_mode      => lookup('profile::kevco_ldap::server::sync_mirror_mode', undef, undef, false),
  }
}
