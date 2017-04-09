class FactoriesController < ApplicationController
  load_and_authorize_resource
  
  before_action :set_factory, only: [:show, :edit, :update, :destroy]

  # GET /factories
  # GET /factories.json
  def index
    @factories = Factory.paginate(page: params[:page], per_page: 10).order(updated_at: :desc)
  end

  # GET /factories/1
  # GET /factories/1.json
  def show
  end

  # GET /factories/new
  def new
    @factory = Factory.new
  end

  # GET /factories/1/edit
  def edit
  end

  # POST /factories
  # POST /factories.json
  def create
    @factory = Factory.new(factory_params)

    respond_to do |format|
      if @factory.save
        format.html { redirect_to @factory, notice: 'Factory was successfully created.' }
        format.json { render :show, status: :created, location: @factory }
      else
        format.html { render :new }
        format.json { render json: @factory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /factories/1
  # PATCH/PUT /factories/1.json
  def update
    respond_to do |format|
      if @factory.update(factory_params)
        format.html { redirect_to @factory, notice: 'Factory was successfully updated.' }
        format.json { render :show, status: :ok, location: @factory }
      else
        format.html { render :edit }
        format.json { render json: @factory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /factories/1
  # DELETE /factories/1.json
  def destroy
    @factory.destroy
    respond_to do |format|
      format.html { redirect_to factories_url, notice: 'Factory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_factory
      @factory = Factory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def factory_params
      params.require(:factory).permit(station_ids: [])
    end
end
