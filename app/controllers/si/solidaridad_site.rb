

module Si::SolidaridadSite
  PROJECT_ID = 2
  AREAS = {:contenido => 5, :foro => 4, :agenda => 6, :actualidad => 7, :materiales => 8, :videos => 9, :enlaces => 10}

  def load_project
    @project = Project.find(PROJECT_ID)
  end
  
  def page_of(area)
    Page.find(AREAS[area.to_sym])
  end
  
  def recent_news
    Page.find(:all, :conditions => ['parent_id = ?', AREAS[:actualidad]], :order => 'position DESC', :limit => 10)
  end
end
