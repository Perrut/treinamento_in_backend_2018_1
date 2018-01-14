Rails.application.routes.draw do
  # arquivo responsável por definir rotas que acionam funções nos
  # nossos controllers

  # formato padrão de rota
  # tipo_requisicão_http 'nome da url', to: "nome_do_controller#nome_da_função", as: :algum_apelido

  # formato de rota root (principal do site)
  # root to: "nome_do_controller#nome_da_função"

  # acessando uma rota GET
  # apelido_da_rota_path

  # acessando uma rota NÃO GET
  # apelido_da_rota_path, method: :post (ou :patch, ou :put, ou :delete)

  # acessando a rota root
  # root_url

  get 'lojas/nova_loja', to: "stores#new", as: :new_store
  get 'lojas', to: "stores#index", as: :stores
  post 'lojas', to: "stores#create"

  # algumas rotas possuem parâmetros, como essa possui o parâmetro id
  delete 'lojas/:id', to: "stores#destroy", as: :destroy_store

  # acessando rotas GET com parâmetros
  # apelido_da_rota_path(nome_do_parametro: valor)

  # acessando rotas NÃO GET com parâmetros
  # apelido_da_rota_path(nome_do_parametro: valor), method: :post (ou :patch, ou :put, ou :delete)

  root to: "static_pages#index"

  get 'home', to: "static_pages#index", as: :home
  get 'sobre', to: "static_pages#about", as: :about

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
