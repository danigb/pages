
module Si::SolidaridadHelper
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

  
  def render_item(page, section)
    if section == 'agenda'
      render_agenda(page)
    else
      return page.title
    end
  end
  
  def render_agenda(page)
    content_tag(:div, :class=>'item agenda') do
      content_tag(:div, page.first_line, :class=> 'date') +
        content_tag(:div, page.title, :class => 'title') +
        content_tag(:div, page.skip_first_line, :class => 'content')
    end
  end
  
end
