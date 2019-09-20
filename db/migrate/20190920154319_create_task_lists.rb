class CreateTaskLists < ActiveRecord::Migration[6.0]
  def change
    create_table :task_lists do |t|

      t.string :name
      t.references :project
      t.string :slug, unique: true

      t.timestamps
    end
  end
end
