class RelatoriosController < ApplicationController

	def r_despesas
		@despesas = Despesa.all
		@total = 0
		@despesas.each do |despesa|
			@total += despesa.valor
		end
		@total
	end

	def filtra
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
		end
	end

	def destroy
		id = params[:id]
		Despesa.destroy id
		redirect_to relatorios_r_despesas_path, notice: "Despesa Excluída!"
	end
end
