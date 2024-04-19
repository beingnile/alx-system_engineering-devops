# Installs flask from pip3

exec { 'Flask':
    command =>  'pip3 install Flask==2.1.0',
    path    =>  ['/usr/bin', '/bin'],
}
