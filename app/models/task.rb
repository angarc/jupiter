class Task < ApplicationRecord

  has_many :user_tasks, dependent: :destroy
  has_many :users, through: :user_tasks

  belongs_to :task_list

  has_many_attached :attachments

  enum priority: [:no_priority, :low, :medium, :high]

end
