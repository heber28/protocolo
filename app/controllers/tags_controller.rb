# encoding: utf-8
class TagsController < ApplicationController
  # GET /Tags
  # GET /Tags.json
  def index
    @tags = Tag.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tags }
      format.json { render json: @tags.where("descricao like ?", "%#{params[:q]}%") }
    end
  end

  # GET /Tags/1
  # GET /Tags/1.json
  def show
    @tag = Tag.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tag }
    end
  end

  # GET /Tags/new
  # GET /Tags/new.json
  def new
    @tag = Tag.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tag }
    end
  end

  # GET /Tags/1/edit
  def edit
    @tag = Tag.find(params[:id])
  end

  # POST /Tags
  # POST /Tags.json
  def create
    @tag = Tag.new(params[:tag])

    respond_to do |format|
      if @tag.save
        format.html { redirect_to @tag, notice: 'A tag foi criada com sucesso.' }
        format.json { render json: @tag, status: :created, location: @tag }
      else
        format.html { render action: "new" }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /Tags/1
  # PUT /Tags/1.json
  def update
    @tag = Tag.find(params[:id])

    respond_to do |format|
      if @tag.update_attributes(params[:tag])
        format.html { redirect_to @tag, notice: 'A tag foi atualizada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Tags/1
  # DELETE /Tags/1.json
  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    respond_to do |format|
      format.html { redirect_to tags_url }
      format.json { head :no_content }
    end
  end
end
