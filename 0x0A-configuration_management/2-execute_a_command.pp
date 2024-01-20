# Kills a process from file killmenow
exec { 'kill_process':
command => 'pkill -f killmenow',
path    => '/usr/bin:/bin',
}
