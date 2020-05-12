class ChangeCpfToDocNumber < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :cpf, :doc_number
  end
end
