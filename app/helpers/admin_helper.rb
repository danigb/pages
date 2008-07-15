module AdminHelper
  def tabs
    result = '<div class="tabs">'
    result << yield
    result <<  '</div><div class="spacer">&nbsp;</div><br/>'
  end  
  
  def  can_add_children(depth, addeable)
    return true if addeable == :all
    return false if addeable == :none
    # TODO: falta aplicar a rangos
    return addeable == depth
  end
  
  def link_to_edit_page(page)
    return link_to(page.title, edit_admin_page_path(page)) unless page.locked?
    return link_to(page.title, {:action => 'meta', :id => page}) if page.locked?
  end

  def icon(name, label, visible = false)
    result = image_tag("icons/#{name.to_s}.png", :alt => label)
    result << "&nbsp;#{label}" if visible
    return result
  end
  
end
