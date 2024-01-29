# Updates an ssh_config file for a client
file { '/etc/ssh/ssh_config':
ensure  => file,
mode    => '0600',
content => "Host *
	IdentityFile ~/.ssh/school
    PasswordAuthentication no
    ChallengeResponseAuthentication no\n",
}
