class Project < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :user_projects, dependent: :destroy
  has_many :users, through: :user_projects
  has_many :task_lists

  validates :name, presence: true, uniqueness: true

  default_scope -> { order(created_at: :desc)}

end
