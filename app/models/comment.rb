class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :task

  has_rich_text :body
  validates_presence_of :body

  default_scope -> { order(created_at: :asc) }

end
