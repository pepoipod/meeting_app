class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :edit_category, :update, :destroy]
  before_action :get_categories, only: [:edit_category]
  layout 'wiki'

  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
  end

  # GET /pages/new
  def new
    @page = Page.new
  end

  # GET /pages/1/edit
  def edit
  end

  def edit_category
    @pages_categories = PagesCategory.where(page_id: @page.id)
  end

  def add_category
    @page = Page.find(params[:page_id])
    pages_category = PagesCategory.new(
      page_id: params[:page_id],
      category_id: params[:category_id]
    )

    if pages_category.save
      redirect_to @page
    else
      format.html { render :new }
      format.json { render json: pages_category.errors, status: :unprocessable_entity }
    end
  end

  def remove_category
    @pages_category = PagesCategory.find(params[:id])
    @pages_category.destroy

    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # POST /pages
  # POST /pages.json
  def create
    parameters = page_params
    parameters[:user_id] = current_user.id
    @page = Page.new(parameters)

    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    def get_categories
      @categories = Category.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:title, :body)
    end
end
