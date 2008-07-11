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
#  project_id :integer(11)     
#

class Page < ActiveRecord::Base
  acts_as_list  :scope => :parent_id
  acts_as_tree  :order => "position"
  has_many :contents, :order => 'id DESC', :dependent => :destroy
  has_many :metas, :order => 'name', :dependent => :destroy
  belongs_to :project
  before_create :calculate_depth, :create_content
  belongs_to :parent, :class_name => 'Page'
  
  def area 
    area_of(self)
  end
  
  def meta(name)
    meta = metas.find_by_name(name.to_s)
    meta.nil? ? nil : meta.value
  end
 	
  def content
    contents.first
  end
  
  
  private
  def area_of(node)
    return node if node.depth == 0
    return area_of(node.parent)
  end

  def create_content
    self.contents.build
  end
  
  def calculate_depth 
    self.depth = ancestors.size
  end
 	
end
