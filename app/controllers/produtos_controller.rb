class ProdutosController < ApplicationController

	def estoque
		@todos = Produto.order :nome
	end

	def new
		@produto = Produto.new
	end

	def busca
		@nome = params[:nome]
		@todos = Produto.where "nome like ?", "%#{@nome}%"
	end

	def create
		valores = params.require(:produto).permit!
		@produto = Produto.create valores
		if @produto.save
			redirect_to produtos_estoque_path, notice: "Produto Criado Com Sucesso!"
		else
			render :new
		end
	end

	def edit
		@produto = Produto.find(params[:id])
		render :edit
	end

	def update
		@produto = Produto.find(params[:id])
		valores = params.require(:produto).permit!
		@produto.update valores
		redirect_to produtos_estoque_path
	end

	def entrada
		@produto = Produto.find(params[:id])
	end

	def somaquantidade
		entrada = params[:entrada].to_i
		@produto = Produto.find(params[:id])
		@produto.update(quantidade: @produto.quantidade + entrada)
		redirect_to produtos_estoque_path
	end

	def destroy
		id = params[:id]
		Produto.destroy id
		redirect_to produtos_estoque_path, notice: "Produto Excluído!"
	end

end
