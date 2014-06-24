# ShadowSoft Manifest to manage the admin user
#
class users::admin {
  # First, create the admin group
  group { 'admin':
    ensure => 'present',
    gid    => '501',
  }

  # Next, make sure the home directory exists
  file {'/home/admin':
    ensure  => 'directory',
    owner   => 'admin',
    group   => 'admin',
    mode    => '0700',
    require => [ Group['admin'], User['admin'], ],
  }

  # Add the admin user
  user {'admin':
    ensure     => 'present',
    uid        => '501',
    gid        => '501',
    home       => '/home/admin',
    managehome => true,
  }
}