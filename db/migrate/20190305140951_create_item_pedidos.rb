class CreateItemPedidos < ActiveRecord::Migration[5.2]
  def change
    create_table :item_pedidos do |t|
      t.references :produto_id, foreign_key: true
      t.references :venda_id, foreign_key: true
      t.decimal :valor_item

      t.timestamps
    end
  end
end
