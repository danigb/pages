
module CambiarHelper
  include AdminHelper
  
  def cambiar_tabs(current)
    tabs do 
      tab('contenido', '', current) <<
        tab('agenda', {:action => 'seccion', :id =>'agenda'}, current) <<
        tab('actualidad', {:action => 'seccion', :id =>'actualidad'}, current) <<
        tab('materiales', {:action => 'seccion', :id =>'materiales'}, current) <<
        tab('videos', {:action => 'seccion', :id =>'videos'}, current) <<
        tab('enlaces', {:action => 'seccion', :id =>'enlaces'}, current)
    end
  end
end
