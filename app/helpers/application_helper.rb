require 'redcloth'

# Methods added to this helper will be available to all templates in the
# application.
module ApplicationHelper 
  include AdminHelper
  include ActionView::Helpers::TagHelper

def redcloth(text)
  RedCloth.new(text).to_html
end
  
  def render_page(page)
    r = $PAGE_RENDERERS[page.mime]
    return r.call(page.content) unless r.nil?
    return page.content
  end
  
  def render_agenda(page)
    content_tag(:div, :class=>'item agenda') do
      content_tag(:div, page.first_line, :class=> 'date') +
        content_tag(:div, page.title, :class => 'title') +
        content_tag(:div, page.skip_first_line, :class => 'content')
    end
  end

  $PAGE_RENDERERS = {}
  $PAGE_RENDERERS['agenda'] = lambda {|p| render_agenda(p)}

  
  def clear
    '<div class="spacer">&nbsp;</div>'
  end
  
  def fecha(date)
    date.strftime('%d/%m/%Y')
  end

  def action(image, text, path)
    img = image.nil? ? '' : image_tag(image)
    '<div class="action">' + link_to("#{img}<span>&nbsp;#{text}</span>", path) + '</div>'
  end
  
  def javascript_action(image, text, javascript) 
    img = image.nil? ? '' : image_tag(image)
    '<div class="action"><a href="#" onClick="javascript:' + javascript + '">' + img + '&nbsp;' + text + '</a></div>';
  end
  
  def submit_button(label, javascript)
    '<div class="spacer"><a href="#" onClick="javascript:' + javascript + '" class="green">' + label + '</a></div>'
  end

  def action_area(&block)
    concat('<div class="actions">', block.binding)
    yield
    concat( '</div><div class="spacer">&nbsp;</div><br/>', block.binding )
  end
  
  def btn_tag(file, label)
    image_tag(file) + " #{label}"
  end
  


  
end
