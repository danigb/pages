
module Si::SolidaridadSite

  def page_of(area)
    Page.find_by_title(area.to_s.upcase)
  end

  def last_page_of_mime(mime)
    Page.find(:first, :conditions => ['mime = ?', mime.to_s], :order => 'created_at DESC')
  end
end
