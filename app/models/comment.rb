class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :task

  has_rich_text :body

  default_scope -> { order(created_at: :asc) }

end
