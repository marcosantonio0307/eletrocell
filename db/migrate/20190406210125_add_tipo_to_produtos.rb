class AddTipoToProdutos < ActiveRecord::Migration[5.2]
  def change
    add_column :produtos, :tipo, :string
  end
end
