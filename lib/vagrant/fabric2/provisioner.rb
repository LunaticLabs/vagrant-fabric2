module Vagrant
  module Fabric2
    class Provisioner < Vagrant.plugin("2", :provisioner)
      def provision
        ssh_info = @machine.ssh_info
        user = ssh_info[:username]
        host = ssh_info[:host]
        port = ssh_info[:port]
        if ssh_info[:private_key_path].kind_of?(Array)
          private_key = ssh_info[:private_key_path][0]
        else
          private_key = ssh_info[:private_key_path]
        end

        if config.remote == false
          system "#{config.fabric_path} -f #{config.fabfile_path} " +
                     "-i #{private_key} --user=#{user} --hosts=#{host} " +
                     "--port=#{port} #{config.tasks.join(' ')}"
        else
          if config.install
            @machine.communicate.sudo("apt-get update")
            @machine.communicate.sudo("apt-get install python3 python3-pip")
            @machine.communicate.sudo("pip3 install fabric")
            @machine.env.ui.info "Finished installing fabric library."
          end
          @machine.communicate.execute("cd #{config.remote_current_dir} && " +
                                           "#{config.fabric_path} -f #{config.fabfile_path} " +
                                           "--user=#{user} --hosts=127.0.0.1 --password=#{config.remote_password} " +
                                           "#{config.tasks.join(' ')}")
          @machine.env.ui.info "Finished fabric task execution."
        end
      end
    end
  end
end
