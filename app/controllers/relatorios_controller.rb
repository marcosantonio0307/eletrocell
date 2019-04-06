class RelatoriosController < ApplicationController

	def r_despesas
		@despesas = Despesa.all
		@total = 0
		@despesas.each do |despesa|
			@total += despesa.valor
		end
		@total
	end

	def r_vendas
		@vendas = Venda.all
		@total = 0
		@vendas.each do |venda|
			@total += venda.valor_total unless venda.valor_total.nil?
		end
		@total
	end

	def filtra
		@total = 0

		@todos = Despesa.all
		@data_inicial = params[:data_inicial]
		@data_final = params[:data_final]
		@despesas = []

		if @data_inicial > @data_final
			redirect_to relatorios_r_despesas_path, notice: "Data inicial é maior que a data final"
		else
			@todos.each do |despesa|
				if despesa.data == @data_inicial 
					@despesas << despesa
				elsif despesa.data > @data_inicial && despesa.data < @data_final
					@despesas << despesa
				elsif despesa.data == @data_final
					@despesas << despesa
				end
			end

			@despesas.each do |despesa|
				@total += despesa.valor
			end
		end
	end

	def filtra_vendas
		@total = 0

		@vendas = Venda.all
		@data_inicial = params[:data_inicial]
		@data_final = params[:data_final]
		@filtro = []

		if @data_inicial > @data_final
			redirect_to relatorios_r_vendas_path, notice: "Data inicial é maior que a data final"
		else
			@vendas.each do |venda|
				if venda.created_at.strftime("%Y-%m-%d") == @data_inicial 
					@filtro << venda
				elsif venda.created_at.strftime("%Y-%m-%d") > @data_inicial && venda.created_at.strftime("%Y/%m/%d") < @data_final
					@filtro << venda
				elsif venda.created_at.strftime("%Y-%m-%d") == @data_final
					@filtro << venda
				end
			end

			@filtro.each do |venda|
				@total += venda.valor_total unless venda.valor_total.nil?
			end
		end
	end

	def destroy
		id = params[:id]
		Despesa.destroy id
		redirect_to relatorios_r_despesas_path, notice: "Despesa Excluída!"
	end
end
