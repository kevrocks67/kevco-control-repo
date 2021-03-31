class role::monitor_server {
  include profile::base::ntp
  include profile::base::packages
  include profile::base::security
  include profile::base::ssh_server
  include profile::base::ssh_client
  include profile::base::users
  include profile::kevco_ldap::client
  include profile::monitoring::prometheus
  include profile::monitoring::node_export
  include profile::monitoring::grafana
}
