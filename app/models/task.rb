class Task < ApplicationRecord

  scope :completed, -> { where(complete: true) }
  scope :not_complete, -> { where(complete: false) }

  has_many :user_tasks, dependent: :destroy
  has_many :users, through: :user_tasks
  accepts_nested_attributes_for :users

  belongs_to :task_list
  belongs_to :project

  has_many_attached :attachments

  enum priority: [:no_priority, :low, :medium, :high]

  def toggle_complete
    if self.complete
      self.complete = false
    else
      self.complete = true
    end

    self.save
  end

end
