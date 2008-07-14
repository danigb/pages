module AdminHelper
  def tabs
    result = '<div class="tabs">'
    result << yield
    result <<  '</div><div class="spacer">&nbsp;</div><br/>'
  end  
  
  def link_to_edit_page(page)
    return link_to(page.title, edit_admin_page_path(page)) unless page.locked?
    return link_to(page.title, {:action => 'meta', :id => page}) if page.locked?
  end

  
end
