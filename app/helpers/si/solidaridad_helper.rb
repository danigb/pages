
module Si::SolidaridadHelper
  include AdminHelper
  include ActionView::Helpers::TagHelper

  FORO_ICONS = [:comments, :comments, :comment]

  def img_nav(name, current)
    state = !current.nil? && current == name ? 'on' : 'off'
    image_tag("solidaridad/#{name}_#{state}.gif", :id => "area-#{name}")
  end

  def cambiar_tabs(current)
    tabs do 
      tab('dossier', {:action => 'dossier'}, current) <<
        tab('foro', {:action => 'foro'}, current) <<
        tab('agenda', {:action => 'seccion', :id =>'agenda'}, current) <<
        tab('actualidad', {:action => 'seccion', :id =>'actualidad'}, current) <<
        tab('materiales', {:action => 'seccion', :id =>'materiales'}, current) <<
        tab('videos', {:action => 'seccion', :id =>'videos'}, current) <<
        tab('enlaces', {:action => 'seccion', :id =>'enlaces'}, current)
    end
  end
  
  def foro_icon(depth, published)
    extra = depth == 0 || published ? '' : '_pending'
    image_tag "icons/#{FORO_ICONS[depth]}#{extra}.png", :style => "margin-left: #{depth}em;"
  end
  
  def render_item(page, section)
    begin
      method(:"render_#{section}").call(page)
    rescue NameError
      "no renderer found!"
    end
  end
  
  def render_hoja(page)
    content_tag(:div, :class=>'item hoja') do
      header = page.title != 'DOSSIER' ? content_tag(:div, page.title, :class => 'title') : ''
      header + content_tag(:div, textilize(page.content), :class => 'content')
    end
  end
  
  def render_materiales(page)
    content_tag(:div, :class=>'item material') do
      if page.attachments.size > 0
        att = page.attachments[0]
        is_pdf = att.content_type == 'application/pdf'
        bloque = content_tag(:div, page.title, :class=> 'title')
        imagen = image_tag(att.public_filename(:thumb)) unless is_pdf
        imagen = image_tag('solidaridad/pdf_thumb.gif') if is_pdf
        link_to(bloque + imagen, att.public_filename, :target => '_blank')
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
      content_tag(:div, content, :class => 'title') +
        content_tag(:div, textilize(page.content), :class=> 'date')
    end
  end
  
  def render_enlaces(page)
    content_tag(:div, :class=>'item enlace') do
      content_tag(:div, link_to(page.title, "http://#{page.content}", :popup => true), :class => 'title') 
    end    
  end
end
  
