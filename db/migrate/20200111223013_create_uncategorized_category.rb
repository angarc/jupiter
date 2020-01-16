class CreateUncategorizedCategory < ActiveRecord::Migration[6.0]
  def change
    Category.create(name: "uncategorized", color: "secondary")
  end
end
