ActionController::Routing::Routes.draw do |map|
  map.root :controller => APP_CONFIG['root'], :action => 'index'
  
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
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end