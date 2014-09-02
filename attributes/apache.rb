site1 = 'challenge8'

node.default['apache']['sites'][site1]['port'] = 80
node.default['apache']['sites'][site1]['cookbook'] = 'challenge8'
node.default['apache']['sites'][site1]['template'] = "apache2/sites/challenge8.erb"
node.default['apache']['sites'][site1]['server_name'] = site1
node.default['apache']['sites'][site1]['server_alias'] = ["#{site1}", "www.#{site1}"]
node.default['apache']['sites'][site1]['docroot'] = "#{node['apache']['docroot_dir']}/#{site1}"
node.default['apache']['sites'][site1]['allow_override'] = ['All']
node.default['apache']['sites'][site1]['errorlog'] = "#{node['apache']['log_dir']}/#{site1}-error.log"
node.default['apache']['sites'][site1]['customlog'] = "#{node['apache']['log_dir']}/#{site1}-access.log combined"
node.default['apache']['sites'][site1]['loglevel'] = 'warn'
node.default['apache']['sites'][site1]['server_admin'] = 'demo@demo.com'
node.default['apache']['sites'][site1]['repository'] = 'https://github.com/mattjbarlow/drupal_skeleton.git'
node.default['apache']['sites'][site1]['deploy_key'] = '/root/.ssh/id_rsa'
