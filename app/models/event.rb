class Event < ActiveRecord::Base

  has_and_belongs_to_many :groups
  has_and_belongs_to_many :users
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates :name, presence: true

  scope :sorted, lambda { order("events.name ASC")}

  scope :type_sort, lambda { order("events.type ASC")}

  scope :time_sort, lambda { order("events.time DESC")}

  scope :type, lambda { |query|
    where(["type LIKE ?", "%#{query}%"])
  }

  scope :search, lambda { |query|
    where(["name LIKE ?", "%#{query}%"])
  }

end
