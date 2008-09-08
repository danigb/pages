module AdminHelper
    include ActionView::Helpers::TagHelper

  def tabs
    result = '<div class="tabs">'
    result << yield
    result <<  '</div><div class="spacer">&nbsp;</div><br/>'
  end

  def admin?
    session[:admin] == true
  end
  
  def  can_add_children(depth, addeable)
    return true if addeable == :all
    return false if addeable == :none
    # TODO: falta aplicar a rangos
    return addeable == depth
  end
  
  def link_to_edit_page(page)
    return link_to(page.title, edit_admin_page_path(page)) # unless page.locked?
    #return link_to(page.title, {:action => 'meta', :id => page}) if page.locked?
  end

  def icon(name, label, visible = false)
    result = image_tag("icons/#{name.to_s}.png", :alt => label)
    result << "&nbsp;#{label}" if visible
    return result
  end
  
  
  def tab(name, path, current)
    current == name ? "<div class=\"active\">#{name}</div>" : link_to( name, path) 
  end
  
  def page_tabs(page, current)
    tabs do
      tab('Páginas', admin_pages_path, current) <<
        tab('Contenido', edit_admin_page_path(page), current) <<
        (session[:admin] ? tab('Metadatos', {:action => 'meta', :id => page}, current) : '') 
    end
  end
  
  def project_tabs(current)
    tabs do
      tab('Páginas', admin_pages_path, current) <<
        (session[:admin] ? tab('Archivos e imágenes', admin_attachments_path, current) : '')
    end
  end
  
end
