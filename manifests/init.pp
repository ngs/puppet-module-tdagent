class td-agent {
  package { 'td-agent':
    ensure  => 'installed',
  }

  file { '/etc/td-agent/conf.d':
    ensure    => 'directory',
    owner     => 'root',
    group     => 'root',
    mode      => 0755,
    recursive => false,
    require   => Package['td-agent'],
  }
  file { '/etc/td-agent/td-agent.conf':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => 0644,
    source  => 'puppet:///modules/td-agent/td-agent.conf',
    require => Package['td-agent'],
  }
}
