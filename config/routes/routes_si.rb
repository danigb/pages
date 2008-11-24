
ActionController::Routing::Routes.draw do |map|
  AdminComponent.route(map)
  map.root :controller => 'si/ver'
  map.connect 'cambiar/:action/:id', :controller => 'si/cambiar'
  map.connect '/:action/:id', :controller => 'si/ver'
  #map.connect '/:id', :controller => 'si/ver', :action => 'pagina'
end

