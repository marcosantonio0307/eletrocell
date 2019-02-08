class Produto < ApplicationRecord

	validates :quantidade, presence: true
	validates :preco_venda, presence: true
	validates :nome, length: { minimum: 5}
end
