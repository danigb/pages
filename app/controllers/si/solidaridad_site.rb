
module Si::SolidaridadSite

  def page_of(area)
    Page.find_by_title(area.to_s.upcase)
  end

end
