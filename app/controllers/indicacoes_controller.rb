class IndicacoesController < ApplicationController
  # GET /indicacoes
  # GET /indicacoes.json
  def index
    if !params[:numero_auto_infracao].blank?
      @indicacoes = Indicacao.where('numero_auto_infracao = ?', params[:numero_auto_infracao])
    else  
      @indicacoes = Indicacao.where('id IS NULL')
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @indicacoes }
    end
  end

  # GET /indicacoes/1
  # GET /indicacoes/1.json
  def show
    @indicacao = Indicacao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @indicacao }
    end
  end

  # GET /indicacoes/new
  # GET /indicacoes/new.json
  def new
    @indicacao = Indicacao.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @indicacao }
    end
  end

  # GET /indicacoes/1/edit
  def edit
    @indicacao = Indicacao.find(params[:id])
  end

  # POST /indicacoes
  # POST /indicacoes.json
  def create
    @indicacao = Indicacao.new(params[:indicacao])

    respond_to do |format|
      if @indicacao.save
        format.html { redirect_to @indicacao, notice: 'A Indicação de Condutor foi criada com sucesso.' }
        format.json { render json: @indicacao, status: :created, location: @indicacao }
      else
        format.html { render action: "new" }
        format.json { render json: @indicacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /indicacoes/1
  # PUT /indicacoes/1.json
  def update
    @indicacao = Indicacao.find(params[:id])

    respond_to do |format|
      if @indicacao.update_attributes(params[:indicacao])
        format.html { redirect_to @indicacao, notice: 'A Indicação do Condutor foi atualizada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @indicacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /indicacoes/1
  # DELETE /indicacoes/1.json
  def destroy
    @indicacao = Indicacao.find(params[:id])
    @indicacao.destroy

    respond_to do |format|
      format.html { redirect_to indicacoes_url }
      format.json { head :no_content }
    end
  end
end
