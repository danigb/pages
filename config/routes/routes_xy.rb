ActionController::Routing::Routes.draw do |map|
  AdminComponent.route(map)
  map.root :controller => 'xy/calcaxy'
  map.connect '/ver/:id', :controller => 'xy/calcaxy', :action => 'pagina'
  map.connect '/booc/:year', :controller => 'xy/calcaxy', :action => 'booc'
  map.connect '/txts/:id', :controller => 'xy/calcaxy', :action => 'txts'
  map.connect '/biobiblio/:id', :controller => 'xy/calcaxy', :action => 'biobiblio'
  map.connect ':action', :controller => 'xy/calcaxy'
end

