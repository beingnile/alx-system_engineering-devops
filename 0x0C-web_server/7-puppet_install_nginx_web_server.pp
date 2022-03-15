# Install nginx using puppet
exec { 'usr/bin/apt-get update':
}

package { 'nginx':
  ensure  => 'installed',
}

exec { 'usr/bin/chown':
  command => 'usr/bin/chown -R "$USER":"$USER" /var/www/html'
}

file { '/var/www/html/index.html':
  content => "Hello World!\n",
}

file { '/var/www/html/404.html':
  content => "Ceci n'est pas une page\n",
}

file { 'config':
  path    => '/etc/nginx/sites-enabled/default',
  content =>
"server {
        listen 80 default_server;
        listen [::]:80 default_server;
               root /var/www/html;
        index index.html index.htm index.nginx-debian.html;
        server_name _;
        location / {
                try_files \$uri \$uri/ =404;
        }
        error_page 404 /404.html;
        location  /404.html {
            internal;
        }
        
        if (\$request_filename ~ redirect_me){
            rewrite ^ https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;
        }
}
",
}

exec { 'service nginx restart':
  command => '/usr/sbin/service nginx restart',
}
