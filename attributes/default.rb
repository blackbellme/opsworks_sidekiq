include_attribute 'deploy'

default[:sidekiq] = {}

node[:deploy].each do |application, deploy|
  unless node[:sidekiq][application]
    next
  end
  default[:sidekiq][application.intern] = {}
  default[:sidekiq][application.intern][:restart_command] = "sudo /sbin/restart workers"
  default[:sidekiq][application.intern][:syslog] = false
  default[:sidekiq][application.intern][:syslog_ident] = nil
end

