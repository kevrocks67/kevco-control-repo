class profile::monitoring::node_export {
  include prometheus::node_exporter
  firewalld_port { 'node_exporter':
    ensure   => present,
    port     => 9100,
    protocol => 'tcp',
  }
}
