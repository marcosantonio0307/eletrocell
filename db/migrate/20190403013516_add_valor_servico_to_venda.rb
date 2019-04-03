class AddValorServicoToVenda < ActiveRecord::Migration[5.2]
  def change
    add_column :vendas, :valor_servico, :decimal
  end
end
