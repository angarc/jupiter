class Project < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :user_projects, dependent: :destroy
  has_many :users, through: :user_projects
  has_many :task_lists, dependent: :destroy
  has_many :tasks
  has_many :project_categories
  has_many :categories, through: :project_categories

  validates :name, presence: true, uniqueness: true

  default_scope -> { order(created_at: :desc)}

  def percentage_complete
    return "Finished!" if self.tasks.not_complete.count == 0

    "#{((self.tasks.completed.count.to_f / self.tasks.count.to_f) * 100).to_i}%"
  end

end
