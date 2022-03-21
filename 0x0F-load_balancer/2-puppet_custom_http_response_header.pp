# Install nginx using puppet and add custom HTTP header
exec { 'update':
  command  => 'apt-get update && apt-get install nginx -y',
  path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}

exec { 'change owner':
  command => 'chown -R "$USER":"$USER" /etc/nginx/sites-enabled',
  path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}

exec { 'Add line'
  command  => 'sudo sed -i "/try_files \$uri \$uri/ =404;/a \t\tadd_header X-Served-By $HOSTNAME;" /etc/nginx/sites-available/default',
  path => '/usr/bin:/usr/sbin:/bin',
}

exec { 'service nginx restart':
  path => '/usr/bin:/usr/sbin:/bin',
}
