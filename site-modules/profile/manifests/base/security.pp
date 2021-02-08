class profile::base::security {
  ################################################
  # SELinux configuration for the environment
  ################################################
  
  class { 'selinux':
    mode => 'enforcing',
    type => 'targeted',
  }
  
  ################################################
  # Sysctl configuration for the environment
  ################################################
  
  sysctl { 'fs.suid_dumpable': value => '0' }
  sysctl { 'kernel.dmesg_restrict': value => '1' }
  sysctl { 'kernel.kptr_restrict': value => '2' }
  sysctl { 'kernel.randomize_va_space': value => '2' }
  sysctl { 'kernel.sysrq': value => '0' }
  sysctl { 'net.ipv4.tcp_syncookies': value => '1' }
  sysctl { 'net.ipv4.tcp_timestamps': value => '1' }
  sysctl { 'net.ipv4.conf.default.accept_source_route': value => '0' }
  sysctl { 'net.ipv4.conf.all.accept_redirects': value => '0' }
  sysctl { 'net.ipv4.conf.default.accept_redirects': value => '0' }
  sysctl { 'net.ipv4.conf.all.send_redirects': value => '0' }
  sysctl { 'net.ipv4.conf.default.send_redirects': value => '0' }
  sysctl { 'net.ipv4.conf.all.secure_redirects': value => '0' }
  sysctl { 'net.ipv4.conf.default.secure_redirects': value => '0' }
  sysctl { 'net.ipv4.conf.all.rp_filter': value => '1' }
  sysctl { 'net.ipv4.conf.default.rp_filter': value => '1' }
  sysctl { 'net.ipv4.conf.all.log_martians': value => '1' }
  sysctl { 'net.ipv4.conf.default.log_martians': value => '1' }
  sysctl { 'net.ipv6.conf.lo.disable_ipv6': value => '0' }
  sysctl { 'net.ipv6.conf.all.disable_ipv6': value => '0' }
  sysctl { 'net.ipv6.conf.default.disable_ipv6': value => '0' }
  sysctl { 'net.ipv6.conf.all.accept_redirects': value => '0' }
  sysctl { 'net.ipv6.conf.default.accept_redirects': value => '0' }
  sysctl { 'vm.swappiness': value => '40' }
  
  ################################################
  # Security limits configuration for the env
  ################################################
  
  limits::limits{'*/core':   hard => 0; }
  limits::limits{'*/fsize':  both => 67108864; }
  limits::limits{'*/locks':  both => 65535; }
  limits::limits{'*/nofile': both => 65535; }
  limits::limits{'*/nproc':  both => 16384; }
  limits::limits{'*/stack':  both => 32768; }
  limits::limits{'root/locks':  both => 65535; }
  limits::limits{'root/nofile': both => 65535; }
  limits::limits{'root/nproc':  both => 16384; }
  limits::limits{'root/stack':  both => 32768; }
  
  # Module does not manage the file /etc/security/limits.conf
  # We might as well warn people from editing it.
  file {'/etc/security/limits.conf':
    ensure  => 'file',
    owner   => '0',
    group   => '0',
    mode    => '0644',
    content => "# Managed by Puppet\n\n",
  }
}
