# encoding: utf-8
class ComentariosController < ApplicationController
  #load_and_authorize_resource :nested => :processo
  load_and_authorize_resource :processo
  load_and_authorize_resource :comentario, :through => :processo, :shallow => true


  before_filter :authorize, only: [:new, :edit, :update, :destroy]
  # GET /comentarios
  # GET /comentarios.json
  def index
    @processo = Processo.find(params[:processo_id])
    @comentarios = @processo.comentarios
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comentarios }
    end
  end

  # GET /comentarios/1
  # GET /comentarios/1.json
  def show
    #cancan @comentario = Comentario.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comentario }
    end
  end

  # GET /comentarios/new
  # GET /comentarios/new.json
  def new
    #cancan @comentario = Comentario.new

    @processo = Processo.find(params[:processo_id])
    @comentario = @processo.comentarios.build
    unauthorized! if cannot? :create, @comentario
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comentario }
    end
  end

  # GET /comentarios/1/edit
  def edit
    #cancan @comentario = Comentario.find(params[:id])
  end

  # POST /comentarios
  # POST /comentarios.json
  def create
    #cancan @comentario = Comentario.new(params[:comentario])

    @processo = Processo.find(params[:processo_id])
    @comentario = @processo.comentarios.build(params[:comentario])
    @comentario.usuario_id = current_user.id
    unauthorized! if cannot? :create, @comentario

    respond_to do |format|
      if @comentario.save
        format.html {
          flash[:notice] = 'O comentário foi incluído com sucesso'
          redirect_to :controller => :comentarios, :action => 'index', :processo_id => @processo.id
        }
        #format.html { redirect_to :controller => :comentarios, :action => 'index', :processo_id => @processo.id, notice: 'O comentario foi criado com sucesso' }
        format.json { render json: @comentario, status: :created, location: @comentario }
      else
        format.html { render action: "new" }
        format.json { render json: @comentario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comentarios/1
  # PUT /comentarios/1.json
  def update
    #cancan @comentario = Comentario.find(params[:id])


    respond_to do |format|
      if @comentario.update_attributes(params[:comentario])
        format.html { redirect_to @comentario, notice: 'O comentário foi alterado com sucesso' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comentario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comentarios/1
  # DELETE /comentarios/1.json
  def destroy
    #cancan @comentario = Comentario.find(params[:id])
    processo_id = @comentario.processo_id
    @comentario.destroy

    @processo = Processo.find(processo_id)
    @comentarios = @processo.comentarios

    respond_to do |format|
      format.html {
        flash[:notice] = 'O comentário foi excluído com sucesso'
        redirect_to :controller => :comentarios, :action => 'index', :processo_id => processo_id
      }
      format.json { head :no_content }
    end
  end
end
