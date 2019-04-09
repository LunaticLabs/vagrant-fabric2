
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "vagrant/fabric2/version"

Gem::Specification.new do |spec|
  spec.name          = "vagrant-fabric2"
  spec.version       = Vagrant::Fabric2::VERSION
  spec.authors       = ["Tom Ketola"]
  spec.email         = ["radius9@gmail.com"]

  spec.summary       = %q{This is a vagrant-fabric2 provisioner}
  spec.description   = %q{I used to use vagrant-fabric, but want to use fabric2, and porting it was a pain. Instead, I created this one..}
  spec.homepage      = "https://github.com/LunaticLabs/vagrant-fabric2"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "http://localhost:9292"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "http://lunaticlabs.com"
    spec.metadata["changelog_uri"] = "http://lunaticlabs.com/CHANGELOG"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
end
