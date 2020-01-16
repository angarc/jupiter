class Task < ApplicationRecord
  scope :completed, -> { where(complete: true) }
  scope :not_complete, -> { where(complete: false) }

  has_many :user_tasks, dependent: :destroy
  has_many :users, through: :user_tasks
  has_many :comments, dependent: :destroy
  has_many_attached :attachments
  has_many :task_categories, dependent: :destroy
  has_many :categories, through: :task_categories
  belongs_to :task_list
  belongs_to :project

  accepts_nested_attributes_for :users

  validates_presence_of :title, :end_date, :users

  enum priority: [:no_priority, :low, :medium, :high]

  delegate :project, to: :task_list, allow_nil: true

  def toggle_complete
    if self.complete
      self.complete = false
    else
      self.complete = true
    end

    self.save
  end
end
