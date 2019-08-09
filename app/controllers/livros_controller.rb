class LivrosController < ApplicationController
  before_action :set_livro, only: [:show, :update, :destroy]

  # GET /livros
  def index
    @livros = Livro.all
    resp = []
    @livros.each do | livro |
      resp.push(
        id:livro.id,
        preco:livro.preco,
        titulo:livro.titulo,
        autor_id:livro.autor_id,
        created_at:livro.created_at,
        updated_at:livro.updated_at,
        autor_name:livro.autor.nome
      )
    end
    render json: resp
  end

  # GET /livros/1
  def show
    render json: @livro
  end

  # POST /livros
  def create
    @livro = Livro.new(livro_params)
    @livros = Livro.all
    
    if @livro.save
      resp = []
      @livros.each do | livro |
        resp.push(
          id:livro.id,
          preco:livro.preco,
          titulo:livro.titulo,
          autor_id:livro.autor_id,
          created_at:livro.created_at,
          updated_at:livro.updated_at,
          autor_name:livro.autor.nome
        )
      end
      render json: resp, status: :created, location: @livro
    else
      render json: @livro.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /livros/1
  def update
    if @livro.update(livro_params)
      render json: @livro
    else
      render json: @livro.errors, status: :unprocessable_entity
    end
  end

  # DELETE /livros/1
  def destroy
    @livro.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_livro
      @livro = Livro.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def livro_params
      params.require(:livro).permit(:titulo, :preco, :autor_id)
    end
end
