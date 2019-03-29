class RenameColumnProduto < ActiveRecord::Migration[5.2]
  def change
  	rename_column :item_pedidos, :produto_id_id, :produto_id
  end
end
