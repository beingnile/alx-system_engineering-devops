# Puppet manifest to configure nginx with custom settings
package { 'nginx':
    ensure =>  installed,
    before =>  File['/var/www/html/index.nginx-debian.html'],
}

# Manage the static content of the index.html
file { '/var/www/html/index.nginx-debian.html':
    ensure  => file,
    content => 'Hello World!',
}

# Custom configuration for nginx to handle the redirection
exec { 'insert_nginx_configuration':
    command => "sed -i '/server_name _;/ a\        location /redirect_me {\\n            return 301 https://x.com/beingnile;\\n        }' /etc/nginx/sites-enabled/default",
    path    => ['/bin', '/usr/bin'],
}

# Ensure nginx service is running and will restart on configuration changes
service { 'nginx':
    ensure => running,
    enable => true,
}
