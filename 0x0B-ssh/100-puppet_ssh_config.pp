# Configure ssh_config file
file { '/etc/ssh/ssh_config':
  ensure  => 'present',
  content => '# This is the ssh client system-wide configuration file.  See\n# ssh_config(5) for more information.  This file provides defaults for\n# users, and the values can be changed in per-user configuration files\n# or on the command line.\n\n# Configuration data is parsed as follows:\n#  1. command line options\n#  2. user-specific file\n#  3. system-wide file\n# Any configuration value is only changed the first time it is set.\n# Thus, host-specific definitions should be at the beginning of the\n# configuration file, and defaults at the end.\n\n# Site-wide defaults for some commonly used options.  For a comprehensive\n# list of available options, their meanings and defaults, please see the\n# ssh_config(5) man page.\n\nInclude /etc/ssh/ssh_config.d/*.conf\n\nHost *\n#   ForwardAgent no\n#   ForwardX11 no\n#   ForwardX11Trusted yes\n    PasswordAuthentication no\n#   HostbasedAuthentication no\n#   GSSAPIAuthentication no\n#   GSSAPIDelegateCredentials no\n#   GSSAPIKeyExchange no\n#   GSSAPITrustDNS no\n#   BatchMode no\n#   CheckHostIP yes\n#   AddressFamily any\n#   ConnectTimeout 0\n#   StrictHostKeyChecking ask\n#   IdentityFile ~/.ssh/id_rsa\n#   IdentityFile ~/.ssh/id_dsa\n#   IdentityFile ~/.ssh/id_ecdsa\n#   IdentityFile ~/.ssh/id_ed25519\n    IdentityFile ~/.ssh/school\n#   Port 22\n#   Ciphers aes128-ctr,aes192-ctr,aes256-ctr,aes128-cbc,3des-cbc\n#   MACs hmac-md5,hmac-sha1,umac-64@openssh.com\n#   EscapeChar ~\n#   Tunnel no\n#   TunnelDevice any:any\n#   PermitLocalCommand no\n#   VisualHostKey no\n#   ProxyCommand ssh -q -W %h:%p gateway.example.com\n#   RekeyLimit 1G 1h\n    SendEnv LANG LC_*\n    HashKnownHosts yes\n    GSSAPIAuthentication yes',
}
