class profile::base::ntp {
  class { 'ntp':
    servers  => lookup('profile::base::ntp::servers'),
    restrict => ['127.0.0.1'],
  }
}
