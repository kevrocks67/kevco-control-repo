class profile::monitoring::prometheus {
  class { 'prometheus::server':
    version        => lookup('profile::prometheus::version'),
    scrape_configs => [
      {
        'job_name'        => 'prometheus',
        'scrape_interval' => lookup('profile::prometheus::prom_scrape_int', undef, undef, '5s'),
        'scrape_timeout'  => lookup('profile::prometheus::prom_scrape_to', undef, undef, '5s'),
        'static_configs'  => [
          { 'targets' => [ "${facts['networking']['interfaces']['eth0']['ip']}:9090" ] },
        ],
      },
      {
        'job_name'        => 'node_exporter',
        'scrape_interval' => lookup('profile::prometheus::node_scrape_int', undef, undef, '5s'),
        'scrape_timeout'  => lookup('profile::prometheus::node_scrape_to', undef, undef, '5s'),
        'static_configs'  => [
          {
            'targets' => lookup('profile::prometheus::node_export_targets')
          },
        ],
      },
    ],
  }
}
