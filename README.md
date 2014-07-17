# Vagrant Dev Box

A no-nonsense environment for PHP development.

## Requirements

This Vagrantfile configuration requires Vagrant 1.5+, VirtualBox, vagrant-omnibus and librarian-chef

## Installation
1. Install Librarian Chef `gem install librarian-chef`
2. Get cookbooks `librarian-chef install`
3. Install vagrant-omnibus `vagrant plugin install vagrant-omnibus`
4. Provision box `vagrant up`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request