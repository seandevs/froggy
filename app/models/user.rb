class User < ActiveRecord::Base
  has_many :frogs
  
  has_attached_file :photo, :styles => { :small => "60x60>", :medium => "150x150>" },
  :url => "/:class/:attachment/:id/:style_:basename.:extension",
  :path => ":rails_root/public/:class/:attachment/:id/:style_:basename.:extension"
  
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/gif']
end
