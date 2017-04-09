class CategoriesController < ApplicationController
  load_and_authorize_resource
  
  before_action :set_category, only: [:show, :edit, :update, :destroy, :prices, :init_prices]

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.paginate(page: params[:page], per_page: 10).order(updated_at: :desc)
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @products = @category.products.paginate(page: params[:page], per_page: 10).order(updated_at: :desc)
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    params = category_params
    if params['logo']
      filename = generate_filename
      Image.upload(params['logo'].tempfile.path, filename)
      params['logo'] = filename
    end
    @category = Category.new(params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    params = category_params
    if params['logo']
      filename = generate_filename
      Image.upload(params['logo'].tempfile.path, filename)
      params['logo'] = filename
    end
    
    respond_to do |format|
      if @category.update(params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def prices
    @prices = @category.prices.paginate(page: params[:page], per_page: 10)
  end

  def init_prices
    @category.products.each do |product|
      product.create_price unless product.price
    end
    redirect_to prices_category_path(@category)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :logo, :is_del)
    end

    def generate_filename
      "category-#{Time.now.to_i * 1000 + rand(1000)}"
    end
  end
