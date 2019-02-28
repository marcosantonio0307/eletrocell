class AddDataToDespesa < ActiveRecord::Migration[5.2]
  def change
    add_column :despesas, :data, :string
  end
end
