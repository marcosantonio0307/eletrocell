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

    produto_id = @item_pedido.produto.id
    @produto = Produto.find(produto_id)
    quantidade_vendida = item_pedido_params[:quantidade].to_i
    @produto.quantidade = @produto.quantidade - quantidade_vendida
    @produto.update(quantidade: @produto.quantidade)

    if @item_pedido.save
      redirect_to edit_venda_path(@venda), notice: 'Item Adicionado com sucesso'
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