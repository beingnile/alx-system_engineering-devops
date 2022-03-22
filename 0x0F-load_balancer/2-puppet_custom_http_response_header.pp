# Install nginx using puppet and add custom HTTP header
exec { 'update':
  command => 'apt-get update',
  path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}

package { 'nginx':
  ensure   => 'installed',
}

exec { 'chown':
  command  => 'chown -R "$USER":"$USER" /etc/nginx/sites-available/default',
  provider => shell,
}

exec { 'custom header':
  command  => 'sudo sed -i "/listen 80 default_server;/a add_header X-Served-By $HOSTNAME;" /etc/nginx/sites-available/default',
  provider => shell,
}

exec { 'service nginx restart':
  path => '/usr/bin:/usr/sbin:/bin',
}
