site1 = 'challenge8'

default['apache']['sites'][site1]['port'] = 80
default['apache']['sites'][site1]['cookbook'] = 'challenge8'
default['apache']['sites'][site1]['template'] = "apache2/sites/challenge8.erb"
default['apache']['sites'][site1]['server_name'] = site1
default['apache']['sites'][site1]['server_alias'] = ["#{site1}", "www.#{site1}"]
default['apache']['sites'][site1]['docroot'] = "#{node['apache']['docroot_dir']}/#{site1}"
default['apache']['sites'][site1]['allow_override'] = ['All']
default['apache']['sites'][site1]['errorlog'] = "#{node['apache']['log_dir']}/#{site1}-error.log"
default['apache']['sites'][site1]['customlog'] = "#{node['apache']['log_dir']}/#{site1}-access.log combined"
default['apache']['sites'][site1]['loglevel'] = 'warn'
default['apache']['sites'][site1]['server_admin'] = 'demo@demo.com'
default['apache']['sites'][site1]['repository'] = 'https://github.com/mattjbarlow/drupal_skeleton.git'
default['apache']['sites'][site1]['deploy_key'] = '/root/.ssh/id_rsa'
default['apache']['sites'][site1]['databases']['challenge8']['mysql_user'] = "drupaluser"
default['apache']['sites'][site1]['databases']['challenge8']['mysql_password'] = "drupaluser"
