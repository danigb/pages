class EditorController < ApplicationController
  layout false
  
  def select_image
    @images = Project.find(params[:id]).attachments
  end
end
