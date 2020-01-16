class Category < ApplicationRecord

  has_many :task_categories, dependent: :destroy
  has_many :categories, through: :task_categories

  validates_uniqueness_of :name

end
