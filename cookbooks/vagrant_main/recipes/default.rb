include_recipe "apt"
include_recipe "build-essential"
include_recipe "openssl"
include_recipe "apache2"
include_recipe "apache2::mod_php5"
include_recipe "apache2::mod_rewrite"
include_recipe "mysql"
include_recipe "mysql::server"
include_recipe "php"
include_recipe "php::module_apc"
include_recipe "php::module_curl"
include_recipe "php::module_mysql"
include_recipe "composer"
include_recipe "vim"
include_recipe "rbenv"
include_recipe "rbenv::ruby_build"

# Initialize sites data bag
sites = []
begin
  sites = data_bag("sites")
rescue
  puts "Sites data bag is empty"
end

# Configure sites
sites.each do |name|
  site = data_bag_item("sites", name)

  # Add site to apache config
  web_app site["host"] do
    template "sites.conf.erb"
    server_name site["host"]
    server_aliases site["aliases"]
    docroot site["docroot"] ? site["docroot"] : "/var/www/#{site["host"]}"
    rewrite_map site["rewrite_map"] if site["rewrite_map"]
  end

   # Add site info in /etc/hosts
   bash "hosts" do
     code "echo 127.0.0.1 #{site["host"]} #{site["aliases"].join(' ')} >> /etc/hosts"
   end
end

# Disable default site
apache_site "default" do
  enable false
end

# Install phpmyadmin
cookbook_file "/tmp/phpmyadmin.deb.conf" do
  source "phpmyadmin.deb.conf"
end

bash "debconf_for_phpmyadmin" do
  code "debconf-set-selections /tmp/phpmyadmin.deb.conf"
end

package "phpmyadmin"

# Install Ruby and Gems
rbenv_ruby "2.0.0-p247" do
  ruby_version "2.0.0-p247"
  global true
end

rbenv_gem "bundler" do
  ruby_version "2.0.0-p247"
end

rbenv_gem "rails" do
  ruby_version "2.0.0-p247"
end