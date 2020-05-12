class AddUniquenessToCpf < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :cpf, unique: true
  end
end
