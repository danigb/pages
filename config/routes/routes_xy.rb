ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'xy/ver'
  map.connect '/ver/:id', :controller => 'xy/ver', :action => 'pagina'
  map.connect ':action', :controller => 'xy/ver'
end

