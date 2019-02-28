class CaixaController < ApplicationController

	def despesa
		@despesa = Despesa.new
	end

	def create
		valores = params.require(:despesa).permit!
		@despesa = Despesa.create valores
		if @despesa.save
			redirect_to relatorios_r_despesas_path, notice: "Despesa salva com sucesso!"
		else
			render :despesa
		end
	end

	def edit
		@despesa = Despesa.find(params[:id])
		render :edit
	end

	def update
		@despesa = Despesa.find(params[:id])
		valores = params.require(:despesa).permit!
		@despesa.update valores
		if @despesa.save
			redirect_to relatorios_r_despesas_path, notice: "Despesa Alterada com Sucesso!"
		else
			render :edit
		end
	end

end
