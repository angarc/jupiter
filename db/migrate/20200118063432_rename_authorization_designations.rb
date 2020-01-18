class RenameAuthorizationDesignations < ActiveRecord::Migration[6.0]
  def change
    User.all.each do |user|
      if user.role == :super_admin
        user.role = :admin
        user.save
      elsif user.role == :admin
        user.role = :user
        user.save
      end
    end
  end
end
