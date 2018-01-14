class StoresController < ApplicationController
  # função responsável por chamar o arquivo homônimo new.html.erb, que está
  # contido dentro da pasta app/views/stores, através de requisição
  # http GET
  def new
    # carrega a variável @store com um novo objeto do tipo Store
    # para ser usado no formulário do arquivo app/views/stores/new.html.erb
    @store = Store.new
  end

  # função responsável por criar um novo objeto do tipo Store, incializá-lo
  # com os parâmetros preenchidos no formulário contido em
  # app/views/stores/new.html.erb através de requisição html POST
  # Não se esquecer de validar todas as operações de bd
  # com o if else
  def create
    @store = Store.new(store_params)
    if @store.save
      # se a operação de salvar o objeto no bd for bem sucedida
      # irá redirecionar para a página app/views/stores/index.html.erb
      # que é controlada pela função index
      # exibindo uma mensagem de sucesso na operação
      flash[:notice] = "Loja criada com sucesso."
      redirect_to stores_path
    else
      # se a operação falhar, irá RENDERIZAR o arquivo
      # app/views/stores/new.html.erb
      # (ou seja, não irá chamar a função new, apenas o arquivo html mesmo)
      # e usará a variável @store definida aqui nessa função
      # usem .now sempre antes de render ;)
      flash.now[:alert] = "Algo errado aconteceu."
      render "new"
    end
  end

  # função responsável por chamar o arquivo homônimo index.html.erb, que está
  # contido dentro da pasta app/views/stores, através de requisição
  # http GET
  def index
    # irá buscar no bd TODOS os registros contidos na tabela stores
    # instanciá-los como objetos da classe Store
    # e armazená-los na variável @stores
    @stores = Store.all
  end

  # função responsável por excluir um registro da tabela stores do bd
  # através de requisião http DELETE
  def destroy
    # irá procurar no bd um loja com o id informado nos parâmetros
    @store = Store.find(params[:id])
    # irá excluir a loja do bd
    @store.destroy
    # irá redirecionar para o função index
    redirect_to stores_path
  end

  private

  # cria uma lista de exclusividade para os parâmetros passados pelo
  # formulário em app/views/stores/new.html.erb
  # ou seja, só os parâmetros que estão nessa lista
  # terão permissão para serem passados adiante
  # (prática de segurança)
  def store_params
    # params é a hash padrão de transferência de parâmetros
    # para toda requisição http na nossa aplicação Rails
    params.require(:store).permit(:address, :telephone)
  end
end
