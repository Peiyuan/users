# ShadowSoft Module to manage the root user
#
class users::root {
  # Create the group
  group {'root':
    ensure => 'present',
    gid    => '0',
  }

  # Create the home directory
  file {'/root':
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0700',
    require => [ Group['root'], User['root'], ],
  }

  # Create the user
  user {'root':
    ensure           => 'present',
    uid              => '0',
    gid              => '0',
    home             => '/root',
    managehome       => true,
    password_max_age => '90',
  }

  # Root authorized_keys file
  file {'/root/.ssh/authorized_keys':
    ensure => 'present',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/users/rootkeys',
  }
}