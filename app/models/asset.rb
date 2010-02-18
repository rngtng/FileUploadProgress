class Asset < ActiveRecord::Base
  
  has_attached_file :file
  
  validates_attachment_presence :file
  
end
