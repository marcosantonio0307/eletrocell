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
  #--------------------------------------------------------------------

  #Relatorios
  get "relatorios/r_despesas" => "relatorios#r_despesas"
end
