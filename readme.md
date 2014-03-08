What is this?
=============

My personal vagrant box that installs my custom development environment.
It provides what I need to get a dev environment bootstrapped.

* Docker
* Fig
* tmux
* vim

Why not boot2docker or dvm???
=============================

Fig makes it easy to do development with docker and enables easy
docker volume sharing. At the time of building this, boot2docker and dvm
don't allow this easily. Also, now I can easily cusomize forwarded ports
with my Vagrantfile.

Requirements
============

* Vagrant
* vagrant-librarian-puppet
* Puppet

Setup
=====

```bash
$ vagrant up
$ vagrant ssh
```
