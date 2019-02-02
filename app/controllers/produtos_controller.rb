class ProdutosController < ApplicationController

	def estoque
		@todos = Produto.order :nome
	end

	def new
		@produto = Produto.new
	end

	def create
		valores = params.require(:produto).permit!
		produto = Produto.create valores
		redirect_to produtos_estoque_url
	end

	def destroy
		id = params[:id]
		Produto.destroy id
		redirect_to produtos_estoque_url
	end

end
