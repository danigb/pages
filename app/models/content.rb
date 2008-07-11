# == Schema Information
#
# Table name: contents
#
#  id         :integer(11)     not null, primary key
#  page_id    :integer(11)     
#  user_id    :integer(11)     
#  data       :text            
#  created_at :datetime        
#  updated_at :datetime        
#  mime       :string(255)     
#

class Content < ActiveRecord::Base
  belongs_to :page

end
