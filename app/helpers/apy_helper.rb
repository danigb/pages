module ApyHelper
  def color_of(page)
    color = page.meta(:color)
    color ||= '#fcfcfc'
  end
end
