class ArquivosController < ApplicationController
  # GET /arquivos
  # GET /arquivos.json
  
  def download
    a = Arquivo.find(params[:id])
    a.arquivo.to_s
    path = Rails.root.realpath.to_s + '/public/uploads/arquivo/' + a.processo.id.to_s + '/' + a.id.to_s + '/'  + a.nome.to_s    
    send_file(path, filename: a.nome)
  end

  def index
    processo_id = params[:processo_id]
    @arquivos = Arquivo.where("processo_id = ?", processo_id)
    @uploader = Arquivo.new.arquivo
    #@uploader.success_action_redirect = new_arquivo_url(:processo_id => processo_id)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @arquivos }
    end
  end

  # GET /arquivos/1
  # GET /arquivos/1.json
  def show
    @arquivo = Arquivo.find(params[:id])
  end

  # GET /arquivos/new
  # GET /arquivos/new.json
  def new
    @arquivo = Arquivo.new
    @arquivo.processo_id = params[:processo_id]
  end

  # GET /arquivos/1/edit
  def edit
    @arquivo = Arquivo.find(params[:id])
  end

  # POST /arquivos
  # POST /arquivos.json
  def create
    @arquivo = Arquivo.new(params[:arquivo])
    if @arquivo.save
      #format.html { redirect_to @processo, notice: 'O processo foi criado com sucesso' }
      #format.json { render json: @processo, status: :created, location: @processo }
      redirect_to processo_url(:id => @arquivo.processo_id), notice: 'O arquivo foi enviado com sucesso.'
      #redirect_to arquivos_url(:processo_id => @arquivo.processo_id), notice: 'O arquivo foi enviado com sucesso.'
    else
      render :new
    end
  end

  # PUT /arquivos/1
  # PUT /arquivos/1.json
  def update
    @arquivo = Arquivo.find(params[:id])

    respond_to do |format|
      if @arquivo.update_attributes(params[:arquivo])
        format.html { redirect_to @arquivo, notice: 'Arquivo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @arquivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /arquivos/1
  # DELETE /arquivos/1.json
  def destroy
    @arquivo = Arquivo.find(params[:id])
    @arquivo.destroy

    respond_to do |format|
      format.html { redirect_to arquivos_url }
      format.json { head :no_content }
    end
  end
end
