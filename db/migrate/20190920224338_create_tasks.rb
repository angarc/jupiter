class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.references :task_list
      t.string :title
      t.date :start_date
      t.date :end_date
      t.text :description
      t.boolean :private
      t.boolean :complete, default: false
      t.integer :priority, default: 0
      t.timestamps
    end
  end
end
