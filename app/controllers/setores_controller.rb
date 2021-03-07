# encoding: utf-8
class SetoresController < ApplicationController
  before_filter :authorize, only: [:new, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /setores
  # GET /setores.json
  def index
    @setores = Setor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @setores }
    end
  end

  # GET /setores/1
  # GET /setores/1.json
  def show
    #cancan @setor = Setor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @setor }
    end
  end

  # GET /setores/new
  # GET /setores/new.json
  def new
    #cancan @setor = Setor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @setor }
    end
  end

  # GET /setores/1/edit
  def edit
    #cancan @setor = Setor.find(params[:id])
  end

  # POST /setores
  # POST /setores.json
  def create
    #cancan @setor = Setor.new(params[:setor])

    respond_to do |format|
      if @setor.save
        format.html { redirect_to @setor, notice: 'Setor foi criado com sucesso' }
        format.json { render json: @setor, status: :created, location: @setor }
      else
        format.html { render action: "new" }
        format.json { render json: @setor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /setores/1
  # PUT /setores/1.json
  def update
    #cancan @setor = Setor.find(params[:id])

    respond_to do |format|
      if @setor.update_attributes(params[:setor])
        format.html { redirect_to @setor, notice: 'Setor foi alterado com sucesso' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @setor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /setores/1
  # DELETE /setores/1.json
  def destroy
    if @setor.processos.size == 0 && @setor.tramites.size == 0
      @setor.destroy
      respond_to do |format|
        format.html {
          flash[:notice] = 'O setor foi excluido com sucesso'
          redirect_to setores_url
        }
        format.json { head :no_content } ####
      end
    else
      respond_to do |format|
        format.html {
          flash[:error] = 'O setor não pode ser excluído pois existem processos ou trâmites dependentes'
          redirect_to setores_url
        }
        format.json { head :no_content }
      end
    end
  end

end
