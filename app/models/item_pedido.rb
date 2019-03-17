class ItemPedido < ApplicationRecord
  belongs_to :produto_id
  belongs_to :venda_id
end
