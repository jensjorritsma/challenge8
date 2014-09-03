include_recipe 'rackops_rolebook::rack_user'
include_recipe 'phpstack::apache'
include_recipe 'phpstack::application_php'
include_recipe 'phpstack::mysql_base'

mysql_connection_info = {
  :host => "localhost",
  :username => 'root',
  :password => node['mysql']['server_root_password']
}

remote_file "/root/drupal.sql" do
  source "http://5f8981e76f355afba706-4f938954db59b7e824997e62ff19ce4f.r83.cf1.rackcdn.com/drupal.sql"
  action :create
  notifies :query, "mysql_database[challenge_db]"
end

mysql_database "challenge_db" do
  connection mysql_connection_info
  database_name node['site1']
  sql { ::File.open("/root/drupal.sql").read }
  action :query
end
