class RenameColumn < ActiveRecord::Migration[5.2]
  def change
  	rename_column :item_pedidos, :venda_id_id, :venda_id
  end
end
