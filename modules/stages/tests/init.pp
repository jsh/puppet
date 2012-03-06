include stages

class {"stages::ssh": stage => 'first',}
#class {"stages::config": }
include stages::config
