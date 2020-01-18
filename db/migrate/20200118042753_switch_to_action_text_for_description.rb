class SwitchToActionTextForDescription < ActiveRecord::Migration[6.0]
  def change
    rename_column :tasks, :description, :old_description

    Task.all.each do |task|
      task.description.body = task.old_description
    end

    remove_column :tasks, :old_description
  end
end
