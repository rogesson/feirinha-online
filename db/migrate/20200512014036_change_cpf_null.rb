class ChangeCpfNull < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :cpf, :string, default: '0', null: false
  end
end
