class Asset < ActiveRecord::Base
  
  has_attached_file :file
  #validates_attachment_presence :file
  validates_presence_of :uuid

  def uuid=(uuid)
    @uuid = uuid
  end
  
  def uuid
    @uuid ||= Asset.generate_uuid
  end

  def self.generate_uuid
     values = [ 0x0010000, 0x0010000, 0x0010000, 0x0010000, 0x0010000, 0x1000000, 0x1000000].map { |nr| rand(nr) }
     "%04x%04x%04x%04x%04x%06x%06x" % values
   end
end
