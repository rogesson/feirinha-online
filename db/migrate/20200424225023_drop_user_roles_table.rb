class DropUserRolesTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :user_roles
  end
end
