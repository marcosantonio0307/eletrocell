class VendasController < ApplicationController

	def new
		@venda = Venda.new
	end

	def create
		valores = params.require(:venda).permit!
		@venda = Venda.new valores
		if @venda.save
			redirect_to @venda[:id]
		end
	end

	def show
	end

end
