File {
    owner   => 'root',
    mode    => 0644,
    group => 'root',
}

file {'/tmp/defaults':
    ensure => directory,
}

file {'/tmp/defaults/hello':
    ensure => file,
}

