class AnexosController < ApplicationController
  # GET /anexos
  # GET /anexos.json
  
  def download
    a = Anexo.find(params[:id])
    a.arquivo.to_s
    path = Rails.root.realpath.to_s + "/uploads/arquivos/#{a.created_at.strftime("%Y/%m/%d")}/#{a.processo.id.to_s.rjust(4, '0')}" + '/' + a.nome.to_s
    send_file(path, filename: a.nome)
  end

  def index
    processo_id = params[:processo_id]
    @anexos = Anexo.where("processo_id = ?", processo_id)
    @uploader = Anexo.new.anexo
    #@uploader.success_action_redirect = new_anexo_url(:processo_id => processo_id)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @anexos }
    end
  end

  # GET /anexos/1
  # GET /anexos/1.json
  def show
    @anexo = Anexo.find(params[:id])
  end

  # GET /anexos/new
  # GET /anexos/new.json
  def new
    @anexo = Anexo.new
    @anexo.processo_id = params[:processo_id]
  end

  # GET /anexos/1/edit
  def edit
    @anexo = Anexo.find(params[:id])
  end

  # POST /anexos
  # POST /anexos.json
  def create
    @anexo = Anexo.new(params[:anexo])
    if @anexo.save
      #format.html { redirect_to @processo, notice: 'O processo foi criado com sucesso' }
      #format.json { render json: @processo, status: :created, location: @processo }
      redirect_to processo_url(:id => @anexo.processo_id), notice: 'O anexo foi enviado com sucesso.'
      #redirect_to anexos_url(:processo_id => @anexo.processo_id), notice: 'O anexo foi enviado com sucesso.'
    else
      render :new
    end
  end

  # PUT /anexos/1
  # PUT /anexos/1.json
  def update
    @anexo = Anexo.find(params[:id])

    respond_to do |format|
      if @anexo.update_attributes(params[:anexo])
        format.html { redirect_to @anexo, notice: 'Anexo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @anexo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /anexos/1
  # DELETE /anexos/1.json
  def destroy
    @anexo = Anexo.find(params[:id])
    @anexo.destroy

    respond_to do |format|
      format.html { redirect_to anexos_url }
      format.json { head :no_content }
    end
  end
end
