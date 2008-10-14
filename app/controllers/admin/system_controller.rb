
class Admin::SystemController < Admin::AdminController
  layout 'admin'

  def info
    
  end

  def clean_cache
    flash[:notice] = 'Se ha borrado la caché'
    expire_page(:controller => '/xy/calcaxy')
    redirect_to :back
  end
end
