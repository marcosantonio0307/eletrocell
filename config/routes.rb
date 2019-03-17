Rails.application.routes.draw do
  
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

  #Vendas
  get "vendas/new" => "vendas#new"
  post "vendas" => "vendas#create"
  get "vendas/:id" => "vendas#show"

  #--------------------------------------------------------------------
end
