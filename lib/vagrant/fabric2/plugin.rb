require "vagrant"

module Vagrant
  module Fabric2
    class Plugin < Vagrant.plugin("2")
      name "fabric2"
      description <<-DESC
        Provides support for provisioning Vagrant instances and using Fabric2 with your provisioning scripts.
      DESC

      config(:fabric2, :provisioner) do
        require File.expand_path("../config", __FILE__)
        Config
      end

      provisioner(:fabric2) do
        require File.expand_path("../provisioner", __FILE__)
        Provisioner
      end
    end
  end
end
