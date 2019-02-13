class RelatoriosController < ApplicationController

	def r_despesas
		@despesas = Despesa.all
		@total = 0
		@despesas.each do |despesa|
			@total += despesa.valor
		end
		@total
	end
end
