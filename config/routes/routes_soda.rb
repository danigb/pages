
ActionController::Routing::Routes.draw do |map|
  AdminComponent.route(map)
  map.root :controller => 'soda/soda'
#  map.connect '/buscar', :controller => 'soda/soda', :action => 'buscar'
  map.connect '/:id', :controller => 'soda/soda', :action => 'pagina'
end

