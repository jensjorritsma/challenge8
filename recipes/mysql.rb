mysql_connection_info = {
  :host => "localhost",
  :username => 'root',
  :password => node['mysql']['server_root_password']
}

#mysql_database "challenge8" do
#  connection mysql_connection_info
#  action :create
#end

mysql_database_user 'challenge8user' do
  connection mysql_connection_info
  password 'Thisisareallysillypassword'
  database_name 'challenge8'
  host '%'
  privileges [:all]
  action :grant
end

remote_file "/root/drupal.sql" do
  source "http://5f8981e76f355afba706-4f938954db59b7e824997e62ff19ce4f.r83.cf1.rackcdn.com/drupal.sql"
  action :create
  notifies :query, "mysql_database[challenge8]", :immediately
#  notifies :run, "execute[import]", :immediately
end

mysql_database "challenge8" do
  connection mysql_connection_info
  sql { ::File.open("/root/drupal.sql").read }
  action :nothing
end

#execute "import" do
#  command "/usr/bin/mysql challenge8 < /root/drupal.sql"
#  action :nothing
#end
