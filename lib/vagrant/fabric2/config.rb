require "vagrant"

module Vagrant
  module Fabric2
    class Config < Vagrant.plugin("2", :config)
      attr_accessor :fabfile_path
      attr_accessor :fabric_path
      attr_accessor :python_path
      attr_accessor :tasks
      attr_accessor :remote
      attr_accessor :remote_install
      attr_accessor :remote_password
      attr_accessor :remote_current_dir

      def initialize
        @fabfile_path = UNSET_VALUE
        @fabric_path = UNSET_VALUE
        @python_path = UNSET_VALUE
        @tasks = UNSET_VALUE
        @remote = UNSET_VALUE
        @remote_install = UNSET_VALUE
        @remote_password = UNSET_VALUE
        @remote_current_dir = UNSET_VALUE
      end

      def finalize!
        @fabfile_path = "fabfile.py" if @fabfile_path == UNSET_VALUE
        @fabric_path = "fab" if @fabric_path == UNSET_VALUE
        @python_path = "python" if @python_path == UNSET_VALUE
        @tasks = [] if @tasks == UNSET_VALUE
        @remote = false if @remote == UNSET_VALUE
        @remote_install = false if @remote_install == UNSET_VALUE
        @remote_password = "vagrant" if @remote_password == UNSET_VALUE
        @remote_current_dir = "." if @remote_current_dir == UNSET_VALUE
      end

      def execute_command(command)
        result = ''
        begin
          IO.popen(command, "w+") do |file|
            file.close_write
            result = file.read
          end
          result
        rescue Errno::ENOENT
          false
        end
      end

      def validate(env)
        errorlist = _detected_errors

        if !File.exist?(fabfile_path)
          errorlist << "fabfile.py doesn't exist"
        end

        for task in tasks

        end

        {"fabric2 provisioner" => errorlist}
      end
    end
  end
end
