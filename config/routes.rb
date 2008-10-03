ActionController::Routing::Routes.draw do |map|

  map.namespace :admin do |admin|
    admin.resources :users
    admin.resources :attachments
    admin.resources :pages do |pages|
      pages.resources :contents
      pages.resources :metas
      pages.resources :attachments
    end  
    admin.resources :site
  end

  
  if APP_CONFIG['name']
    require "#{RAILS_ROOT}/config/routes/routes_#{APP_CONFIG['name']}.rb"
  elsif
    map.root :controller => APP_CONFIG['root'], :action => 'index'    
    map.connect ':controller/:action/:id'
    map.connect ':controller/:action/:id.:format'
  end

  
end