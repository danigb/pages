# == Schema Information
#
# Table name: pages
#
#  id         :integer(11)     not null, primary key
#  parent_id  :integer(11)     
#  title      :string(255)     not null
#  position   :integer(11)     
#  depth      :integer(5)      
#  state      :string(12)      
#  created_at :datetime        
#  updated_at :datetime        
#  content    :text            
#  mime       :string(12)      
#

class Page < ActiveRecord::Base
  
  STATES = ['published', 'locked', 'draft']
  RENDERERS = {}
  
  acts_as_list  :scope => :parent_id
  acts_as_tree  :order => "position"
  has_many :revisions, :order => 'id DESC', :dependent => :destroy
  has_many :metas, :order => 'name', :dependent => :destroy
  has_many :attachments, :dependent => :destroy
  belongs_to :project
  before_create :calculate_depth
  belongs_to :parent, :class_name => 'Page'
  searches_on :title, :content

  def self.children_of(id)
    Page.find_all_by_parent_id(id)
  end

  def attachment(name)
    Attachment.find_by_page_id_and_label self.id, name.to_s
  end

  def locked?
    self.state == 'locked'
  end
  
  def meta(name)
    meta = metas.find_by_name(name.to_s)
    meta.nil? ? nil : meta.value
  end

  def published?
    self.state == 'published'
  end
  
  
  def first_line
    self.content.nil? ? '' : self.content[/^.*\n/]
  end
  
  def skip_first_line
    self.content.nil? ? '' : self.content[first_line.length...self.content.length]
  end
   	
  private
  def calculate_depth
    self.depth = ancestors.size
  end
 	
end
