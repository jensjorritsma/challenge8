mysql_connection_info = {
  :host => "localhost",
  :username => 'root',
  :password => node['mysql']['server_root_password']
}

mysql_database "create_db" do
  connection mysql_connection_info
  database_name "drupal"
  action :create
end

mysql_database_user "drupaluser" do
  connection mysql_connection_info
  password "drupaluser"
  database_name 'drupal'
  host '%'
  privileges [:all]
  action :grant
end

remote_file "/root/drupal.sql" do
  source "http://5f8981e76f355afba706-4f938954db59b7e824997e62ff19ce4f.r83.cf1.rackcdn.com/drupal.sql"
  action :create
  notifies :run, "execute[import]", :immediately
end

execute "import" do
  command "mysql drupal -p#{node['mysql']['server_root_password']}< /root/drupal.sql"
  action :nothing
end
