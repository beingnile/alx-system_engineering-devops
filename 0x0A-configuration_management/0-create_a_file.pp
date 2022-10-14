# Creates a file school in /tmp with thr content 'I love Puppet'
file { 'school':
    ensure  => present,
    path    => '/tmp/school',
    content => 'I love Puppet',
    group   => www-data,
    owner   => www-data,
    mode    => '0744'
}
