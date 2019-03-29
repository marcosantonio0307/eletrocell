class ItemPedidosController < ApplicationController

  def index
    @venda = Venda.find(params[:venda_id])
    @itens = ItemPedido.where(venda_id: @venda.id)
  end

	def new
		@item_pedido = ItemPedido.new
    @venda = Venda.find(params[:venda_id])
	end

	def create
    @venda = Venda.find(params[:venda_id])
    item_pedido_params = params.require(:item_pedido).permit!
    @item_pedido = ItemPedido.create item_pedido_params
    @item_pedido.venda = @venda
    if @item_pedido.save
      redirect_to venda_item_pedidos_path(@venda), notice: 'Item Adicionado com sucesso'
    else
      render :new
    end
 	end

  def destroy
    id = params[:id]
    ItemPedido.destroy id
    redirect_to venda_item_pedidos_path, notice: "Item Excluido!"
  end

end