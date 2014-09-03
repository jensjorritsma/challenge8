include_recipe 'rackops_rolebook::rack_user'
include_recipe 'phpstack::apache'
include_recipe 'phpstack::application_php'
include_recipe 'phpstack::mysql_base'
