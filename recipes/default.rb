#
# Cookbook Name:: forensic_reporter
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

cookbook_file '/usr/local/bin/forensic_reporter' do
  mode 0755
end

cookbook_file '/etc/init/forensic_reporter.conf' do
  mode 0644
end

link '/etc/init.d/forensic_reporter' do
  to '/lib/init/upstart-job'
end

service 'forensic_reporter' do
  supports restart: true, status: true
  provider Chef::Provider::Service::Upstart
  action %i(start enable)
end
