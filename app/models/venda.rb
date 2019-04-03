class Venda < ApplicationRecord
	has_many :item_pedido

	validates :cliente, presence: true
	validates :valor_total, presence: true
end
