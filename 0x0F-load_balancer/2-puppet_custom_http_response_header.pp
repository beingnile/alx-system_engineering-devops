# Ensure packages are updated and Nginx is installed
exec { 'apt-update':
    command => '/usr/bin/apt-get update',
    path    => ['/bin', '/usr/bin'],
    before  => Exec['apt-upgrade'],
}

exec { 'apt-upgrade':
    command => '/usr/bin/apt-get upgrade -y',
    path    => ['/bin', '/usr/bin', '/usr/sbin', '/sbin'],
    before  => Package['nginx'],
}

package { 'nginx':
    ensure => installed,
}

# Manage index.html and 404.html files
file { '/var/www/html/index.nginx-debian.html':
    ensure  => file,
    content => 'Hello World!\n',
    owner   => 'www-data',
    group   => 'www-data',
    mode    => '0644',
    require => Package['nginx'],
}

file { '/var/www/html/404.html':
    ensure  => file,
    content => "Ceci n'est pas une page\n",
    owner   => 'www-data',
    group   => 'www-data',
    mode    => '0644',
    require => Package['nginx'],
}

# Manage Nginx configuration files directly
file { '/etc/nginx/sites-enabled/default':
    ensure  => file,
    content => "\
# Default server configuration
#
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/html;
    index index.html index.htm index.nginx-debian.html;

	server_name _;
    location /redirect_me {
        return 301 https://x.com/beingnile;
    }
    error_page 404 /404.html;
    location = /404.html {
        internal;
    }
}
",
    require => Package['nginx'],
}

file { '/etc/nginx/nginx.conf':
    ensure  => file,
    content => "\
user www-data;
worker_processes auto;
pid /run/nginx.pid;
include /etc/nginx/modules-enabled/*.conf;

events {
        worker_connections 768;
        # multi_accept on;
}

http {

        ##
        # Basic Settings
        ##

        add_header X-Served-By \$hostname;
        sendfile on;
        tcp_nopush on;
        tcp_nodelay on;
        keepalive_timeout 65;
        types_hash_max_size 2048;
        # server_tokens off;

        # server_names_hash_bucket_size 64;
        # server_name_in_redirect off;

        include /etc/nginx/mime.types;
        default_type application/octet-stream;

        ##
        # SSL Settings
        ##

        ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
        ssl_prefer_server_ciphers on;

        ##
        # Logging Settings
        ##

        access_log /var/log/nginx/access.log;
        error_log /var/log/nginx/error.log;

        gzip on;

        include /etc/nginx/conf.d/*.conf;
        include /etc/nginx/sites-enabled/*;
}
",
    require => Package['nginx'],
}

# Ensure Nginx is running and enabled to start at boot
service { 'nginx':
    ensure  => running,
    enable  => true,
    require => Package['nginx'],
}
