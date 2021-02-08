define remote_auth::user (
  $k5logins,
  $pub_key      = undef,
  $pub_key_type = 'ssh-rsa',
  $group        = undef,
  $shell        = undef,
  $comment      = undef,
) {
  user { $title:
    ensure  => present,
    groups  => $groups,
    shell   => $shell,
    home    => "/home/${title}",
    comment => $comment,
  }
  
  file { "/home/${title}/.k5login":
    ensure  => file,
    owner   => $title,
    group   => $title,
    mode    => '0700',
    content => template('remote_auth/k5login.erb'),
  }

  
  file { "/home/${title}":
    ensure  => directory,
    owner   => $title,
    group   => $title,
    mode    => '0751',
    before  => File["/home/${title}/.k5login"],
  }
  
  if $pub_key != undef {
    ssh_authorized_key { "${title}@${facts['hostname']}":
      ensure => present,
      user   => $title,
      type   => $type,
      key    => $pub_key,
    }

    file { "/home/${title}/.ssh":
      ensure  => directory,
      owner   => $title,
      group   => $title,
      mode    => '0700',
      before  => Ssh_authorized_key["${title}@${facts['hostname']}"],
    }
  }
}
