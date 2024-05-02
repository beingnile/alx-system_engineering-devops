# Ensure packages are updated and Nginx is installed
exec { 'apt-update':
    command =>  '/usr/bin/apt-get update',
    path    =>  ['/bin', '/usr/bin'],
}

exec { 'apt-upgrade':
    command => '/usr/bin/apt-get upgrade -y',
    path    => ['/bin', '/usr/bin'],
}

package { 'nginx':
    ensure  => installed,
}

# Manage index.html and 404.html files
file { '/var/www/html/index.nginx-debian.html':
    ensure  => file,
    content => 'Hello World!',
    owner   => 'www-data',
    group   => 'www-data',
    mode    => '0644',
}

file { '/var/www/html/404.html':
    ensure  => file,
    content => "Ceci n'est pas une page",
    owner   => 'www-data',
    group   => 'www-data',
    mode    => '0644',
}

# Add configuration for error page and redirect
file_line { 'nginx_error_page':
    path               => '/etc/nginx/sites-enabled/default',
    line               => '        error_page 404 /404.html;',
    match              => '^        error_page 404 /404.html;',
    append_on_no_match => true,
    require            => File['/var/www/html/404.html'],
}

file_line { 'nginx_404_location':
    path               => '/etc/nginx/sites-enabled/default',
    line               => '        location = /404.html { internal; }',
    match              => '^        location = /404.html { internal; }',
    append_on_no_match => true,
    require            => File_line['nginx_error_page'],
}

file_line { 'nginx_redirect_location':
    path               => '/etc/nginx/sites-enabled/default',
    line               => '        location /redirect_me { return 301 https://x.com/beingnile; }',
    match              => '^        location /redirect_me { return 301 https://x.com/beingnile; }',
    append_on_no_match => true,
    require            => Package['nginx'],
}

# Add custom header in nginx.conf
file_line { 'nginx_custom_header':
    path    => '/etc/nginx/nginx.conf',
    line    => '        add_header X-Served-By $hostname;',
    match   => '^        add_header X-Served-By \$hostname;',
    after   => '^        sendfile on;',
    require => Package['nginx'],
}

# Ensure Nginx is running and enabled to start at boot
service { 'nginx':
    ensure => running,
    enable => true,
}
