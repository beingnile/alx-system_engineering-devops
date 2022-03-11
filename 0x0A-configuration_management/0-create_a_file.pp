file { '/tmp/school':
  ensure  => 'present',
  replace => 'no',
  group   => 'www-data',
  owner   => 'www-data',
  content => 'I love Puppet',
  mode    => '0744',
}
