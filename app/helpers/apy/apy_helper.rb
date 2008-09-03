module Apy::ApyHelper
  def color_of(page)
    color = page.meta(:color)
    color ||= '#fcfcfc'
  end
  
  def apy_tabs(current)
    tabs do 
      tab('dossier', {:action => 'dossier'}, current)
    end
  end
    
end
