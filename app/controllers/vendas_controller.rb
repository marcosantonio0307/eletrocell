class VendasController < ApplicationController

	def index
		@vendas = Venda.all
	end

	def new
		@venda = Venda.new
	end

	def create
		valores = params.require(:venda).permit!
		@venda = Venda.new valores
		if @venda.save
			redirect_to "/vendas/#{@venda.id}", notice: 'Nova venda cadastrada!'
		end
	end

	def destroy
		id = params[:id]
		Venda.destroy id
		redirect_to vendas_path, notice: "Venda Excluida!"
	end

	def show
		@venda = Venda.find(params[:id])
	end

end
