class TaskList < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :project

  validates :name, presence: true

  default_scope { order(created_at: :desc) }

end
