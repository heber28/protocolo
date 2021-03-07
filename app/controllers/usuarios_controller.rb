# encoding: utf-8
class UsuariosController < ApplicationController
  load_and_authorize_resource
  before_filter :authorize

  # GET /usuarios
  # GET /usuarios.json
  def index
    #@usuarios = Usuario.all
    unauthorized! if cannot? :read, @usuarios.first
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @usuarios }
    end
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
    #cancan @usuario = Usuario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @usuario }
    end
  end

  # GET /usuarios/new
  # GET /usuarios/new.json
  def new
    #cancan @usuario = Usuario.new
    @usuario.autor = true
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @usuario }
    end
  end

  # GET /usuarios/1/edit
  def edit
    #cancan @usuario = Usuario.find(params[:id])
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    #cancan @usuario = Usuario.new(params[:usuario])
    unauthorized! if cannot? :create, @usuario

    respond_to do |format|
      if @usuario.save
        format.html { redirect_to @usuario, notice: 'Usuario foi criado com sucesso' }
        format.json { render json: @usuario, status: :created, location: @usuario }
      else
        format.html { render action: "new" }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /usuarios/1
  # PUT /usuarios/1.json
  def update
    #cancan @usuario = Usuario.find(params[:id])
    #unauthorized! if cannot? :update, @usuario
    respond_to do |format|
      if @usuario.update_attributes(params[:usuario])
        format.html { redirect_to @usuario, notice: 'Usuario foi alterado com sucesso' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    #cancan @usuario = Usuario.find(params[:id])
    if @usuario.processos.size == 0 && @usuario.tramites.size == 0 && @usuario.comentarios.size == 0
      @usuario.destroy
      respond_to do |format|
        format.html {
          flash[:notice] = 'O usuário foi excluido com sucesso'
          redirect_to usuarios_url
        }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html {
          flash[:error] = 'O usuário não pode ser excluído pois existem processos ou comentários ou trâmites dependentes'
          redirect_to usuarios_url
        }
        format.json { head :no_content }
      end
    end
  end

end
