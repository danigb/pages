# == Schema Information
#
# Table name: projects
#
#  id         :integer(11)     not null, primary key
#  name       :string(255)     not null
#  created_at :datetime        
#  updated_at :datetime        
#  public_url :string(255)     
#

class Project < ActiveRecord::Base
  has_many :pages
  has_many :attachments
  has_many :users
  has_many :templates
end
