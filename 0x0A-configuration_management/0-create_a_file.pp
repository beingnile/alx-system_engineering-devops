# Creates a file school in tmp
file { 'school':
ensure  => file,
path    => '/tmp/school',
group   => 'www-data',
owner   => 'www-data',
mode    => '0744',
content => 'I love Puppet',
}
