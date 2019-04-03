class AddClienteToVenda < ActiveRecord::Migration[5.2]
  def change
    add_column :vendas, :cliente, :string
  end
end
