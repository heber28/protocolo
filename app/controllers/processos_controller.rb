# encoding: utf-8
class ProcessosController < ApplicationController
  before_filter :authorize, only: [:new, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /processos
  # GET /processos.json
  def index
    p = Hash.new
    params[:setor_id].blank? ? p[:setor_id] = '' : p[:setor_id] = params[:setor_id]
    params[:assunto].blank? ? p[:assunto] = '' : p[:assunto] = params[:assunto]
    params[:numero_git].blank? ? p[:numero_git] = '' : p[:numero_git] = params[:numero_git]
    params[:nome].blank? ? p[:nome] = '' : p[:nome] = params[:nome]
    params[:cpf].blank? ? p[:cpf] = '' : p[:cpf] = params[:cpf]
    params[:cnpj].blank? ? p[:cnpj] = '' : p[:cnpj] = params[:cnpj]

    if params[:dt_cini].blank?
      p[:dt_cini] = ''
    else
      dt = params[:dt_cini]
      dt_cini = dt.to_datetime
      p[:dt_cini] = dt_cini.strftime('%Y-%m-%d')
    end
    if params[:dt_cfim].blank?
      p[:dt_cfim] = ''
    else
      dt = params[:dt_cfim]
      dt_cfim = dt.to_datetime
      p[:dt_cfim] = dt_cfim.strftime('%Y-%m-%d')
    end
    if params[:dt_tini].blank?
      p[:dt_tini] = ''
    else
      dt = params[:dt_tini]
      dt_tini = dt.to_datetime
      p[:dt_tini] = dt_tini.strftime('%Y-%m-%d')
    end
    if params[:dt_tfim].blank?
      p[:dt_tfim] = ''
    else
      dt = params[:dt_tfim]
      dt_tfim = dt.to_datetime
      p[:dt_tfim] = dt_tfim.strftime('%Y-%m-%d')
    end
    params[:descricao].blank? ? p[:descricao] = '' : p[:descricao] = params[:descricao]
    @processos = Processo.procurar(p, params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @processos }
    end
  end

  # GET /processos/1
  # GET /processos/1.json
  def show
    #@processo = Processo.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @processo }
    end
  end

  # GET /processos/new
  # GET /processos/new.json
  def new
    @processo.setor_id = current_setor.id
    @processo.usuario_id = current_user.id
    unauthorized! if cannot? :create, @processo
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @processo }
    end
  end

  # GET /processos/1/edit
  def edit
    #cancan @processo = Processo.find(params[:id])
  end

  # POST /processos
  # POST /processos.json
  def create
    @processo = Processo.new(params[:processo])

    @processo.usuario_id = current_user.id
    unauthorized! if cannot? :create, @processo

    @processo.comentarios.each do |comentario|
      comentario.usuario_id = current_user.id if comentario.new_record?
    end
    anterior = @processo.setor_id
    @processo.tramites.each do |tramite|
      if tramite.new_record?
        tramite.usuario_id = current_user.id
      end
      tramite.setor_id_anterior = anterior
      anterior = tramite.setor_id
    end

    @processo.anexos.each do |anexo|
      if anexo.new_record?
        anexo.usuario_id = current_user.id
      end
    end
   
    @processo.setor_id = current_setor.id

    if @processo.tramites.size == 0
      @processo.setor_id_atual = @processo.setor_id
      @processo.data_tramite = Date.today
    else
      @processo.setor_id_atual = @processo.tramites.last.setor_id
    end

    @processo.errors.clear
    respond_to do |format|
      if @processo.save
        format.html { redirect_to @processo, notice: 'O processo foi criado com sucesso' }
        format.json { render json: @processo, status: :created, location: @processo }
      else
        @processo.errors.each do |key, value|
          flash[key] = value
        end
        format.html { render action: "new" }
        format.json { render json: @processo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /processos/1
  # PUT /processos/1.json
  def update
    #cancan @processo = Processo.find(params[:id])
    @processo.attributes = params[:processo]
    @processo.comentarios.each do |comentario|
      comentario.usuario_id = current_user.id if comentario.new_record?
    end
    anterior = @processo.setor_id
    @processo.tramites.each do |tramite|
      if tramite.new_record?
        tramite.usuario_id = current_user.id
      end
      tramite.setor_id_anterior = anterior
      anterior = tramite.setor_id
    end
    if @processo.tramites.size == 0
      @processo.setor_id_atual = @processo.setor_id
    else
      @processo.setor_id_atual = @processo.tramites.last.setor_id
    end

    @processo.anexos.each do |anexo|
      if anexo.new_record?
        anexo.usuario_id = current_user.id
      end
    end

    respond_to do |format|
      @processo.errors.clear
      if @processo.save
        @comentarios = @processo.comentarios.all
        format.html { redirect_to @processo, notice: 'O processo foi alterado com sucesso' }
        format.json { head :no_content }
      else
        @processo.errors.each do |key, value|
          flash[key] = value
        end
        format.html { render action: "edit" }
        format.json { render json: @processo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /processos/1
  # DELETE /processos/1.json

  def destroy
    #cancan @processo = Processo.find(params[:id])
    if @processo.destroy
      flash[:notice] = 'O processo foi excluído com sucesso'
    else
      @processo.errors.each do |key, value|
        flash[key] = value
      end
    end
    respond_to do |format|
      format.html { redirect_to :controller => :processos, :action => :index }
      format.json { head :no_content }
    end
  end

  def pesquisar
    sql = 'id IS NOT NULL'
    sql = ' AND cpf = ?' if !params[:cpf].blank?
    sql = ' AND cnpj = ?' if !params[:cnpj].blank?
    sql = ' AND numero_git = ?' if !params[:git].blank?    
    conditions = []
    conditions << sql
    conditions << params[:cpf] if !params[:cpf].blank?
    conditions << params[:cnpj] if !params[:cnpj].blank?
    conditions << params[:numero_git] if !params[:numero_git].blank?    
    @processos = Processo.where(conditions)
  end

  def visualizar
    @processo = Processo.find(params[:processo_id])
    @historico = @processo.comentarios + @processo.tramites
    @historico.sort! { |x, y| x.created_at <=> y.created_at }
  end

end
