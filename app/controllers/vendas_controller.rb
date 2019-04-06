class VendasController < ApplicationController

	def index
		@vendas = Venda.all
	end

	def new
		@venda = Venda.new
		@venda.cliente = 'Cliente'
		@venda.valor_servico = 0
		@venda.save
		redirect_to edit_venda_path(@venda)
	end

	def edit
		@venda = Venda.find(params[:id])
		@itens = ItemPedido.where(venda_id: @venda.id)	
	end

	def update
		valores = params.require(:venda).permit!
		params[:valor_total] = @total_itens
		@venda = Venda.find(params[:id])
		@venda.update valores
		redirect_to relatorios_r_vendas_path
	end

	def destroy
		id = params[:id]
		Venda.destroy id
		redirect_to relatorios_r_vendas_path, notice: "Venda Excluida!"
	end

	def show
		@venda = Venda.find(params[:id])
		@itens = ItemPedido.where(venda_id: @venda.id)
	end	

end
