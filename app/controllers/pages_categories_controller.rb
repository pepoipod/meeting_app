class PagesCategoriesController < ApplicationController
  before_action :set_pages_category, only: [:show, :edit, :update, :destroy]

  # GET /pages_categories
  # GET /pages_categories.json
  def index
    @pages_categories = PagesCategory.all
  end

  # GET /pages_categories/1
  # GET /pages_categories/1.json
  def show
  end

  # GET /pages_categories/new
  def new
    @pages_category = PagesCategory.new
  end

  # GET /pages_categories/1/edit
  def edit
  end

  # POST /pages_categories
  # POST /pages_categories.json
  def create
    @pages_category = PagesCategory.new(pages_category_params)

    respond_to do |format|
      if @pages_category.save
        format.html { redirect_to @pages_category, notice: 'Pages category was successfully created.' }
        format.json { render :show, status: :created, location: @pages_category }
      else
        format.html { render :new }
        format.json { render json: @pages_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages_categories/1
  # PATCH/PUT /pages_categories/1.json
  def update
    respond_to do |format|
      if @pages_category.update(pages_category_params)
        format.html { redirect_to @pages_category, notice: 'Pages category was successfully updated.' }
        format.json { render :show, status: :ok, location: @pages_category }
      else
        format.html { render :edit }
        format.json { render json: @pages_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages_categories/1
  # DELETE /pages_categories/1.json
  def destroy
    @pages_category.destroy
    respond_to do |format|
      format.html { redirect_to pages_categories_url, notice: 'Pages category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pages_category
      @pages_category = PagesCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pages_category_params
      params.require(:pages_category).permit(:page_id, :category_id)
    end
end
