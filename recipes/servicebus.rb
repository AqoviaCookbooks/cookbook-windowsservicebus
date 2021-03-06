#
# Cookbook Name:: windowsservicebus
# Recipe:: node
#
# Copyright (C) 2015 Taliesin Sisson
#
# All rights reserved - Do Not Redistribute
#

include_recipe "webpi::install-msi"

registry_key 'Use relative directory for Local AppData' do
    key 'HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders'
    values [{
        :name => "Local AppData",
        :type => :expand_string,
        :data => "%~dp0appdata"
        }]
        action :create
end

webpi_product 'ServiceBus_1_1,ServiceBus_1_1_CU1,ServiceBus_1_1_NETFramework46_Update' do
    accept_eula true
    action :install
end

registry_key 'Use profile\AppData\Local for Local AppData' do
    key 'HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders'
    values [{
        :name => "Local AppData",
        :type => :expand_string,
        :data => '%USERPROFILE%\AppData\Local'
        }]
end