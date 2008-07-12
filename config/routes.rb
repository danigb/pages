ActionController::Routing::Routes.draw do |map|

  map.root :controller => 'projects'

  map.resources :projects do |projects|
     projects.resources :users
     projects.resources :attachments
     projects.resources :pages do |pages|
        pages.resources :contents
        pages.resources :metas
        pages.resources :attachments
     end
  end
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end