
ActionController::Routing::Routes.draw do |map|
  AdminComponent.route(map)
  map.root :controller => 'apy/ver'
  map.connect '/buscar', :controller => 'apy/ver', :action => 'buscar'
  map.connect '/:id', :controller => 'apy/ver', :action => 'pagina'
end

