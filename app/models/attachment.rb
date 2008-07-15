# == Schema Information
#
# Table name: attachments
#
#  id           :integer(11)     not null, primary key
#  content_type :string(255)     
#  filename     :string(255)     
#  size         :integer(11)     
#  tags         :string(255)     
#  description  :string(255)     
#  parent_id    :integer(11)     
#  thumbnail    :string(255)     
#  width        :integer(11)     
#  height       :integer(11)     
#  created_at   :datetime        
#  updated_at   :datetime        
#

class Attachment < ActiveRecord::Base
  has_attachment :storage => :file_system, :thumbnails => { :thumb => 'x50' }, :path_prefix => 'public/files/development'
  validates_as_attachment
  belongs_to :page
end


