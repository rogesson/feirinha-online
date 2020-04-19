class ChangeIndexToUsersRoles < ActiveRecord::Migration[5.2]
  def change
    remove_index :user_roles, [:user_id]
    add_index :user_roles, [:user_id], unique: true
  end
end
