
module Xy::XyHelper

  def image_of(page, name)
    if page.attachment name
      image_tag page.attachment(name).public_filename
    end
  end
end