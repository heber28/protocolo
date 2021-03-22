# encoding: utf-8
class TramitesController < ApplicationController
  #load_and_authorize_resource :nested => :processo
  #load_and_authorize_resource :processo
  load_and_authorize_resource :tramite, :through => :processo, :shallow => true

  # GET /tramites
  # GET /tramites.json
  def index
    @tramites = Tramite.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tramites }
    end
  end

  # GET /tramites/1
  # GET /tramites/1.json
  def show
    @tramite = Tramite.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tramite }
    end
  end

  # GET /tramites/new
  # GET /tramites/new.json
  def new
    @tramite = Tramite.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tramite }
    end
  end

  # GET /tramites/1/edit
  def edit
    @tramite = Tramite.find(params[:id])
  end

  # POST /tramites
  # POST /tramites.json
  def create
    @tramite = Tramite.new(params[:tramite])

    respond_to do |format|
      if @tramite.save
        processo = Processo.find_by_id(@tramite.processo_id)
        processo.setor_id_atual = @tramite.setor_id
        processo.save
        format.html { redirect_to @tramite, notice: 'O trâmite foi criado com sucesso.' }
        format.json { render json: @tramite, status: :created, location: @tramite }
      else
        format.html { render action: "new" }
        format.json { render json: @tramite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tramites/1
  # PUT /tramites/1.json
  def update
    @tramite = Tramite.find(params[:id])
    respond_to do |format|
      if @tramite.update_attributes(params[:tramite])
        t = Tramite.find("where processo_id = ? and id > ?", @tramite.processo_id, @tramite.id).order("id")
        if t.size == 0
          processo = Processo.find(@tramite.processo_id)
          processo.setor_id_atual = @tramite.setor_id
          processo.save
        else
          t = t.first
          if t.setor_id_anterior != @tramite.setor_id
            t.setor_id_anterior = @tramite.setor_id
            t.save
          end
        end
        format.html { redirect_to @tramite, notice: 'O trâmite foi atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tramite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tramites/1
  # DELETE /tramites/1.json
  def destroy
    @tramite = Tramite.find(params[:id])
    @tramite.destroy

    respond_to do |format|
      format.html { redirect_to tramites_url }
      format.json { head :no_content }
    end
  end

  def remessa
    @remessas = Tramite.where("id is null")
    params[:datetimepicker] = Time.now.strftime("%d/%m/%Y 00:00") if params[:data].blank?
    params[:setor_id] = current_setor.id

    inicio = DateTime.strptime(params[:datetimepicker], "%d/%m/%Y %H:%M").to_datetime
    @setor_id = params[:setor_id]
    @remessas = Tramite.where("processo_id is not null and created_at >= ? and setor_id_anterior = ?", inicio, params[:setor_id]).order(:setor_id)

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "remessa"  
      end
    end
  end
end
