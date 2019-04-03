class AddQuantidadeToItempedido < ActiveRecord::Migration[5.2]
  def change
    add_column :item_pedidos, :quantidade, :integer
  end
end
