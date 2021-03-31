class profile::monitoring::grafana {
  class { 'grafana':
    cfg                      => {
      app_mode => 'production',
      server   => {
        http_addr => '0.0.0.0',
        http_port => lookup('profile::grafana::http_port', undef, undef, 3000),
      },
    },
  }
}
