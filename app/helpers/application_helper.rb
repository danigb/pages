# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper 
  include AdminHelper
  
  def clear
    '<div class="spacer">&nbsp;</div>'
  end
  
  def fecha(date)
    date.strftime('%d/%m/%Y')
  end

  def action(image, text, path)
    img = image.nil? ? '' : image_tag(image)
        
    '<div class="action">' + link_to("#{img}<span>&nbsp;#{text}</span>", path) + '</div>'
  end
  
  def javascript_action(image, text, javascript) 
    img = image.nil? ? '' : image_tag(image)
    '<div class="action"><a href="#" onClick="javascript:' + javascript + '">' + img + '&nbsp;' + text + '</a></div>';
  end
  
  def submit_button(label, javascript)
    '<div class="spacer"><a href="#" onClick="javascript:' + javascript + '" class="green">' + label + '</a></div>'
  end

  def action_area(&block)
    concat('<div class="actions">', block.binding)
    yield
    concat( '</div><div class="spacer">&nbsp;</div><br/>', block.binding )
  end
  
  def btn_tag(file, label)
    image_tag(file) + " #{label}"
  end
  
  def page_tabs(page, current) 
    tabs do
      tab('visualizar', admin_page_content_path(page, page.content), current) <<
      tab('contenido', edit_admin_page_content_path(page, page.content), current) <<
      tab('metadatos', admin_page_path, current) 
    end
  end
  
  def project_tabs(current)
    tabs do
      tab('general', {:controller => 'admin/site'}, current) <<
      tab('páginas', admin_pages_path, current) <<
      tab('imágenes y archivos', admin_attachments_path, current)
    end
  end

  def tab(name, path, current)
    current == name ? "<div class=\"active\">#{name}</div>" : link_to( name, path) 
  end
  
end
