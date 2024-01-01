class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  # Ransack
  def self.ransackable_attributes(_auth_object = nil)
    ['title']
  end

  def self.ransackable_associations(_auth_object = nil)
    []
  end
end
