class Despesa < ApplicationRecord
	validates :data, presence: true
	validates :valor, presence: true
end
