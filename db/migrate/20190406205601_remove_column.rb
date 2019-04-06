class RemoveColumn < ActiveRecord::Migration[5.2]
  def change
  	remove_column :vendas, :valor_servico
  end
end
