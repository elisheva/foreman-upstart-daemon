require "erb"
require "foreman/export"

class Foreman::Export::UpstartDaemon < Foreman::Export::Base

  def export
    error("Must specify a location") unless location

    FileUtils.mkdir_p location

    app = self.app || File.basename(engine.directory)
    user = self.user || app
    log_root = self.log || "/var/log/#{app}"
    template_root = File.join(File.dirname(__FILE__),'../data/templates')

    Dir["#{location}/#{app}*.conf"].each do |file|
      say "cleaning up: #{file}"
      FileUtils.rm(file)
    end

    master_template = File.join(template_root,'upstart_daemon','master.conf.erb')
    master_config   = ERB.new(File.read(master_template)).result(binding)
    write_file "#{location}/#{app}.conf", master_config

    process_template = File.join(template_root,'upstart_daemon','process.conf.erb')

    engine.procfile.entries.each do |process|
      next if (conc = self.concurrency[process.name]) < 1
      process_master_template = File.join(template_root,'upstart_daemon','process_master.conf.erb')
      process_master_config   = ERB.new(File.read(process_master_template)).result(binding)
      write_file "#{location}/#{app}-#{process.name}.conf", process_master_config

      1.upto(self.concurrency[process.name]) do |num|
        port = engine.port_for(process, num, self.port)
        process_config = ERB.new(File.read(process_template)).result(binding)
        write_file "#{location}/#{app}-#{process.name}-#{num}.conf", process_config
      end
    end
  end

end