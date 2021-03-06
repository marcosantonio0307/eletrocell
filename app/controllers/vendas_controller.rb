class VendasController < ApplicationController

	def index
		@vendas = Venda.all
	end

	def new
		@venda = Venda.new
		@venda.cliente = 'Cliente'
		todas = Venda.all
		if todas.size > 0
			contador = Venda.last.id
			contador += 1
			@venda.id = contador
		else
			@venda.id = 1
		end
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
		redirect_to relatorios_r_vendas_path, notice: 'Venda Salva com sucesso!'
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
