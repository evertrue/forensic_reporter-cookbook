#
# Cookbook Name:: forensic_reporter
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

if node['platform_family'] == 'debian'
  include_recipe 'apt'
  resources(execute: 'apt-get update').run_action(:run)
end

%w(
  mailutils
  bc
).each { |pkg| package pkg }

file '/etc/forensic_reporter.conf' do
 content lazy { (exports_config(node['forensic_reporter']['env']) + "\n") }
end

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
  %w(
    cookbook_file[/usr/local/bin/forensic_reporter]
    cookbook_file[/etc/init/forensic_reporter.conf]
    file[/etc/forensic_reporter.conf]
  ).each { |subscription| subscribes :restart, subscription }
end
