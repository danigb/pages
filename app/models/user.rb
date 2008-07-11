# == Schema Information
#
# Table name: users
#
#  id         :integer(11)     not null, primary key
#  email      :string(255)     not null
#  password   :string(255)     not null
#  project_id :integer(11)     
#  created_at :datetime        
#  updated_at :datetime        
#

class User < ActiveRecord::Base
  belongs_to :project
end
