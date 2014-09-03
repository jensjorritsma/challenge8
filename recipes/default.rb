include_recipe 'rackops_rolebook::rack_user'
include_recipe 'phpstack::apache'
include_recipe 'phpstack::application_php'
include_recipe 'phpstack::mysql_base'

mysql_connection_info = {
  :host => "localhost",
  :username => 'root',
  :password => node['mysql']['server_root_password']
}

mysql_database "challenge_db" do
  connection mysql_connection_info
  database_name node['site1']
  action :create
end

remote_file "/root/drupal.sql" do
  source "http://5f8981e76f355afba706-4f938954db59b7e824997e62ff19ce4f.r83.cf1.rackcdn.com/drupal.sql"
  action :create
  notifies :run, "execute[import]"
end

execute "import" do
  command "/usr/bin/mysql #{node['site1']} < /root/drupal.sql"
  action :nothing
end
