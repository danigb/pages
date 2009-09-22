
ActionController::Routing::Routes.draw do |map|
  AdminComponent.route(map)
  map.deudaecologia '/deudaecologica', :controller => 'apy/ver', :action => 'pagina', :id => 72
  map.root :controller => 'apy/ver'
  map.connect '/buscar', :controller => 'apy/ver', :action => 'buscar'
  map.connect '/:id', :controller => 'apy/ver', :action => 'pagina'
end

