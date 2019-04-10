class Venda < ApplicationRecord
	has_many :item_pedido, dependent: :destroy

end
