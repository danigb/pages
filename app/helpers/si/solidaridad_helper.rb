
module Si::SolidaridadHelper
  include AdminHelper
  include ActionView::Helpers::TagHelper

  
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

  
  def render_item_old(page, section)
    if section == 'agenda'
      render_agenda(page)
    else
      return page.title
    end
  end
  
  def render_item(page, section)
    method(:"render_#{section}").call(page)
  end
  
  def render_agenda(page)
    content_tag(:div, :class=>'item agenda') do
      content_tag(:div, page.first_line, :class=> 'date') +
        content_tag(:div, page.title, :class => 'title') +
        content_tag(:div, page.skip_first_line, :class => 'content')
    end
  end
    
  def render_actualidad(page)
    pdf = page.attachments.size > 0 ? page.attachments[0] : nil
    content_tag(:div, :class => 'item actualidad') do
      content_tag(:div, page.content, :class=> 'date') +
        content_tag(:div,:class => 'title') do
          if !pdf.nil?
            link_to page.title, pdf.public_filename, :popup => ['_blank']
          else
            page.title
          end
        end
    end
  end
end
  
