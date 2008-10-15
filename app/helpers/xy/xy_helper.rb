
module Xy::XyHelper

  def image_of(page, name)
    if page.attachment name
      image = image_tag page.attachment(name).public_filename, :size => "193x117"
      if page.attachment(:main)
        link_to_function image, "show_image('#{page.attachment(:main).public_filename}');"
      else
        image
      end
    end
  end
end