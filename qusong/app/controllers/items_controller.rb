class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_waybill, only: [:new, :create, :edit, :update, :destroy]

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = @waybill.order.items.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @waybill, notice: 'Item was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @waybill, notice: 'Item was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to @waybill, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_waybill
      @waybill = Waybill.find(params[:waybill_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:amount, :product_id)
    end
end
