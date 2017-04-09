class WaybillsController < ApplicationController
  before_action :set_waybill, only: [:show, :edit, :update, :destroy, :yiqu]

  # GET /waybills
  # GET /waybills.json
  def index
    @pickup_waybills = current_courier.pickup_waybills
    @deliver_waybills = current_courier.deliver_waybills
  end

  # GET /waybills/1
  # GET /waybills/1.json
  def show
  end

  # GET /waybills/new
  def new
    @waybill = Waybill.new
  end

  # GET /waybills/1/edit
  def edit
  end

  # POST /waybills
  # POST /waybills.json
  def create
    @waybill = Waybill.new(waybill_params)

    respond_to do |format|
      if @waybill.save
        format.html { redirect_to @waybill, notice: 'Waybill was successfully created.' }
        format.json { render :show, status: :created, location: @waybill }
      else
        format.html { render :new }
        format.json { render json: @waybill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /waybills/1
  # PATCH/PUT /waybills/1.json
  def update
    respond_to do |format|
      if @waybill.update(waybill_params)
        format.html { redirect_to @waybill, notice: 'Waybill was successfully updated.' }
        format.json { render :show, status: :ok, location: @waybill }
      else
        format.html { render :edit }
        format.json { render json: @waybill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /waybills/1
  # DELETE /waybills/1.json
  def destroy
    @waybill.destroy
    respond_to do |format|
      format.html { redirect_to waybills_url, notice: 'Waybill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def yiqu
    respond_to do |format|
      if @waybill.yiqu
        format.html { redirect_to :back, notice: '取件成功.' }
      else
        format.html { redirect_to :back, alert: "取件失败. #{@waybill.errors}" }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_waybill
      @waybill = Waybill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def waybill_params
      params.fetch(:waybill, {})
    end
end
