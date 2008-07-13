
module Si::SolidaridadSite

  def page_of(area)
    Page.find_by_title(area.to_s.upcase)
  end
  
  def recent_news
    news = page_of(:actualidad)
    Page.find(:all, :conditions => ['parent_id = ?', news.id], :order => 'position DESC', :limit => 10)
  end
end
