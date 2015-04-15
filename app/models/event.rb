class Event < ActiveRecord::Base

  has_and_belongs_to_many :groups
  has_and_belongs_to_many :users
  validates :name, presence: true

  scope :sorted, lambda { order("events.name ASC")}

  scope :type_sort, lambda { order("events.type ASC")}

  scope :time_sort, lambda { order("events.time ASC")}

  scope :type, lambda { |query|
    where(["type LIKE ?", "%#{query}%"])
  }

  scope :search, lambda { |query|
    where(["name LIKE ?", "%#{query}%"])
  }

end
