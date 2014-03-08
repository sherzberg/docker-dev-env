include docker

package {'base-deps':
  name   => ['python-dev', 'python-pip', 'vim-nox', 'git', 'mercurial', 'tmux'],
  ensure => present,
}

user {'sherzberg':
  ensure     => present,
  managehome => true,
}

package {'pip':
  ensure   => latest,
  provider => 'pip',
  require  => Package['base-deps'],
}

package {'python-deps':
  name    => ['pss', 'fig', 'wheel', 'virtualenv', 'virtualenvwrapper', 'bpython', 'ipython', 'autoenv'],
  provider => 'pip',
  require => Package['pip'],
}