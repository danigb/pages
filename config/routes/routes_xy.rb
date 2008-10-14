ActionController::Routing::Routes.draw do |map|
  AdminComponent.route(map)
  map.root :controller => 'xy/calcaxy'
  map.connect '/ver/:id', :controller => 'xy/calcaxy', :action => 'pagina'
  map.connect ':action', :controller => 'xy/calcaxy'
end

