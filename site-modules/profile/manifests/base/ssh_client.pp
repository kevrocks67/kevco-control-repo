class profile::base::ssh_client{
  class { 'ssh::client':
    options => {
      'Host *' => {
        'GSSAPIAuthentication'      => 'yes',
        'GSSAPIDelegateCredentials' => 'no',
        'GSSAPIKeyExchange'         => 'no',
        'GSSAPITrustDNS'            => 'no',
        'Include'                   => '/etc/ssh/ssh_config.d/*.conf',
      },
    },
  }  
}
