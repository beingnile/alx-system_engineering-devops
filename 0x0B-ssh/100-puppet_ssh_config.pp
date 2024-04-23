# Customizes an ssh config file

file { '/etc/ssh/ssh_config':
    ensure  =>  'present',
}

file_line { 'Turn off password auth':
    ensure =>  'present',
    path   =>  '/etc/ssh/ssh_config',
    line   =>  '\t PasswordAuthentication no',
    match  =>  '^PasswordAuthentication',
}

file_line { 'Declare Identity file':
    ensure =>  'present',
    path   =>  '/etc/ssh/ssh_config',
    line   =>  '\t IdentityFile ~/.ssh/school',
    match  =>  '^IdentityFile ~/.ssh/id_rsa',
}
