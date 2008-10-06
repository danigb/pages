
require "#{RAILS_ROOT}/config/applications/admin.rb"

if APP_CONFIG['name']
  require "#{RAILS_ROOT}/config/applications/routes_#{APP_CONFIG['name']}.rb"
elsif
  ActionController::Routing::Routes.draw do |map|
    AdminComponent.route(map)
    map.root :controller => APP_CONFIG['root'], :action => 'index'
    map.connect ':controller/:action/:id'
    map.connect ':controller/:action/:id.:format'
  end

  
end