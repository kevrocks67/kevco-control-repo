class profile::base::packages {
  ################################################
  # Packages/services configuration for the env
  ################################################
  
  $packages_to_install = [
    'bzip2',
    'deltarpm',
    'dos2unix',
    'gzip',
    'htop',
    'iotop',
    'krb5-libs',
    'krb5-workstation',
    'lsof',
    'mailx',
    'rsync',
    'tmux',
    'unzip',
    'vim' ,
    'zstd' ,
  ]
  package { $packages_to_install: ensure => 'installed' }
  
  $packages_to_purge = [
    'aic94xx-firmware',
    'alsa-firmware',
    'alsa-utils',
    'ivtv-firmware',
    'iw',
    'iwl1000-firmware',
    'iwl100-firmware',
    'iwl105-firmware',
    'iwl135-firmware',
    'iwl2000-firmware',
    'iwl2030-firmware',
    'iwl3160-firmware',
    'iwl3945-firmware',
    'iwl4965-firmware',
    'iwl5000-firmware',
    'iwl5150-firmware',
    'iwl6000-firmware',
    'iwl6000g2a-firmware',
    'iwl6000g2b-firmware',
    'iwl6050-firmware',
    'iwl7260-firmware',
    'iwl7265-firmware',
    'wireless-tools',
    'wpa_supplicant',
  ]
  package { $packages_to_purge: ensure => 'purged' }
  
  ## Manage some specific services below
  service { 'kdump': enable => false, }
  service { 'puppet': enable => true, }
}
