class ItemPedido < ApplicationRecord
  belongs_to :produto
  belongs_to :venda

  validates :valor_item, presence: true
end
