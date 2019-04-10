# Vagrant Fabric2 Provisioner

This is a [Vagrant](http://www.vagrantup.com) provisioner based on [Vagrant-Fabric](https://github.com/wutali/vagrant-fabric/), but adds support for [Fabric2](http://docs.fabfile.org/en/latest/).

## Installation

To install, open your Vagrant environment and type

    vagrant plugin install vagrant-fabric2   
    
## Usage

Add the following configuration to your Vagrantfile::

    config.vm.provision :fabric2 do |fabric2|
        fabric2.fabfile_path = "./fabfile.py"
        fabric2.tasks = [ "task1", "task2" ]
    end

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lunaticlabs/vagrant-fabric2.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
