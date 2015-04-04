class Group < ActiveRecord::Base

  has_and_belongs_to_many :events
  has_and_belongs_to_many :users

  scope :sorted, lambda { order("groups.group_name ASC")}
  scope :category, lambda { |query|
    where(["category LIKE ?", "%#{query}%"])
  }
  scope :search, lambda { |query|
    where(["group_name LIKE ?", "%#{query}%"])
  }

end
