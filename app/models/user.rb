class User < ActiveRecord::Base

  has_and_belongs_to_many :events
  has_and_belongs_to_many :groups
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  
end
