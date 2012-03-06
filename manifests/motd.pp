file {'/etc/motd':
    content => template('/etc/puppetlabs/puppet/templates/motd.erb'),
}
