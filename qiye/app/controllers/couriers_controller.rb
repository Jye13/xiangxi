class CouriersController < ApplicationController
  load_and_authorize_resource
  
  before_action :set_courier, only: [:show, :edit, :update, :destroy]

  # GET /couriers
  # GET /couriers.json
  def index
    @couriers = Courier.paginate(page: params[:page], per_page: 10).order(updated_at: :desc)
  end

  # GET /couriers/1
  # GET /couriers/1.json
  def show
  end

  # GET /couriers/1/edit
  def edit
  end

  # PATCH/PUT /couriers/1
  # PATCH/PUT /couriers/1.json
  def update
    respond_to do |format|
      if @courier.update(courier_params)
        format.html { redirect_to @courier, notice: 'Courier was successfully updated.' }
        format.json { render :show, status: :ok, location: @courier }
      else
        format.html { render :edit }
        format.json { render json: @courier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /couriers/1
  # DELETE /couriers/1.json
  def destroy
    @courier.destroy
    respond_to do |format|
      format.html { redirect_to couriers_url, notice: 'Courier was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_courier
      @courier = Courier.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def courier_params
      params.require(:courier).permit(station_ids: [])
    end
end
