module AdminHelper
  def tabs
    result = '<div class="tabs">'
    result << yield
    result <<  '</div><div class="spacer">&nbsp;</div><br/>'
  end  
  

end
