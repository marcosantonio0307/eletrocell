class CaixaController < ApplicationController

	def despesa
		@despesa = Despesa.new
	end

	def create
		valores = params.require(:despesa).permit!
		@despesa = Despesa.create valores
		if @despesa.save
			redirect_to root_path, notice: "Despesa salva com sucesso!"
		else
			render :despesa
		end
	end
end
