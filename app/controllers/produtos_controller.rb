class ProdutosController < ApplicationController

	def index

		#estoque alto na index
		@estoque_alto = []
		estoque_alto = Produto.all
		estoque_alto.each do |produto|
			if produto.quantidade > 15
				@estoque_alto << produto
			end
		end
		@estoque_alto = @estoque_alto.sort_by{|produto| produto.quantidade}.reverse

		#estoque baixo na index
		@estoque_baixo = []
		estoque_baixo = Produto.all
		estoque_baixo.each do |produto|
			if produto.quantidade < 5
				@estoque_baixo << produto
			end
		end
		@estoque_baixo = @estoque_baixo.sort_by{|produto| produto.quantidade}

		#ultimas vendas na index
		@ultimas_vendas = Venda.last(5)
		@ultimas_vendas = @ultimas_vendas.reverse

		#ultimas despesas na index
		@ultimas_despesas = Despesa.last(5)
		@ultimas_despesas = @ultimas_despesas.reverse
	end

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
		if @produto.save
			redirect_to produtos_estoque_path, notice: "Produto Alterado com Sucesso!"
		else
			render :edit
		end
	end

	def entrada
		@produto = Produto.find(params[:id])
	end

	def somaquantidade
		entrada = params[:entrada].to_i
		@produto = Produto.find(params[:id])
		@produto.update(quantidade: @produto.quantidade + entrada)
		if @produto.save
			redirect_to produtos_estoque_path, notice: "Entrada Realizada com Sucesso!"
		else
			render :entrada
		end
	end

	def destroy
		id = params[:id]
		Produto.destroy id
		redirect_to produtos_estoque_path, notice: "Produto Excluído!"
	end

end
