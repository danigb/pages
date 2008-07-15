
module Si::SolidaridadHelper
  include AdminHelper
  include ActionView::Helpers::TagHelper

  def cambiar_tabs(current)
    tabs do 
      tab('dossier', {:action => 'dossier'}, current) <<
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
    begin
      method(:"render_#{section}").call(page)
    rescue NameError
      page.title + "<br/>" + (page.content.nil? ? '' : page.content)
    end
  end
  
  def render_materiales(page)
    content_tag(:div, :class=>'item material') do
      if page.attachments.size > 0
        att = page.attachments[0]
        link_to image_tag(att.public_filename(:thumb)) + '<br/>' + content_tag(:span, page.title, :class=> 'title'), att.public_filename 
      else
        content_tag(:div, page.title, :class => 'title')
      end
    end    
  end
  
  def render_agenda(page)
    content_tag(:div, :class=>'item agenda') do
      content_tag(:div, page.first_line, :class=> 'date') +
        content_tag(:div, page.title, :class => 'title') +
        content_tag(:div, textilize(page.skip_first_line), :class => 'content')
    end
  end
  
  def render_videos(page)
    content_tag(:div, :class=>'item video') do
      content_tag(:div, page.title, :class => 'title') +
        content_tag(:div, page.content, :class => 'content')
    end
    
  end
    
  def render_actualidad(page)
    pdf = page.attachments.size > 0 ? page.attachments[0] : nil
    content = !pdf.nil? ? link_to(page.title, pdf.public_filename, :popup => ['_blank']) : page.title
    content_tag(:div, :class => 'item actualidad') do
      content_tag(:div, textilize(page.content), :class=> 'date') +
        content_tag(:div, content, :class => 'title') 
    end
  end
  
  def render_enlaces(page)
    content_tag(:div, :class=>'item enlace') do
      content_tag(:div, link_to(page.title, "http://#{page.content}", :popup => true), :class => 'title') 
    end    
  end
end
  
