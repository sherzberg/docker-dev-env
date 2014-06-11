
class { 'docker':
  version     => '1.0.0',
  tcp_bind    => 'tcp://127.0.0.1:4243',
  socket_bind => 'unix:///var/run/docker.sock',
}

apt::ppa { 'ppa:fkrull/deadsnakes': }
->
package {'python3.4-dev':
  ensure => present,
}
->
package {'pypy-dev':
  ensure => present,
}

package {['python-dev', 'python-pip', 'vim-nox', 'git', 'mercurial', 'tmux']:
  ensure => present,
}

user {'sherzberg':
  ensure     => present,
  managehome => true,
}

package {'pip':
  ensure   => latest,
  provider => 'pip',
  require  => Package['python-pip'],
}

package {['pss', 'fig', 'wheel', 'virtualenv', 'virtualenvwrapper', 'bpython', 'ipython', 'autoenv']:
  provider => 'pip',
  require => Package['pip'],
}
