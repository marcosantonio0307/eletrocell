Rails.application.routes.draw do

  devise_for :users
  resources :vendas do
    resources :item_pedidos
  end
  
  #Estoque
  post "produtos" => "produtos#create"
  get "produtos/estoque" => "produtos#estoque"
  get "produtos/new" => "produtos#new"
  delete "produtos/:id" => "produtos#destroy", as: :produto
  get "produtos/busca" => "produtos#busca", as: :busca_produto
  get "produtos/:id/edit" => "produtos#edit", as: :edit_produto
  get "produtos/:id/entrada" => "produtos#entrada", as: :entrada_produto
  post "produtos/:id/entrada" => "produtos#somaquantidade"
  patch "produtos/:id" => "produtos#update"
  root "produtos#index"
  #--------------------------------------------------------------------
  
  #Caixa
  get "caixa/despesas" => "caixa#despesa"
  post "despesas" => "caixa#create"
  get "caixa/:id/edit" => "caixa#edit", as: :edit_despesa
  patch "relatorios/:id" => "caixa#update"
  #--------------------------------------------------------------------

  #Relatorios
  get "relatorios/r_despesas" => "relatorios#r_despesas"
  delete "relatorios/:id" => "relatorios#destroy", as: :despesa
  get "relatorios/filtra" => "relatorios#filtra", as: :filtra_despesas
  get "relatorios/r_vendas" => "relatorios#r_vendas"
  get "relatorios/filtra_vendas" => "relatorios#filtra_vendas"

  #Vendas
  get "vendas/filtra" => "vendas#filtra"
  get "vendas/new" => "vendas#new"
  get "vendas/:id" => "vendas#show"
  post "vendas/:id" => "vendas#show"
  post "vendas" => "vendas#create"
  get "vendas" => "vendas#index"
  delete "vendas/:id" => "vendas#destroy"

  #post "vendas/:id/item_pedidos" => "item_pedidos#index", as: :item_pedidos
  #get "vendas/:id/item_pedidos/new" => "item_pedidos#new", as: :new_vendas_item_pedidos
  #post "vendas/:id/item_pedidos/create" => "item_pedidos#create", as: :venda_item_pedidos
  #--------------------------------------------------------------------


end
