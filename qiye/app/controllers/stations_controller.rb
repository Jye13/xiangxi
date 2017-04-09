class StationsController < ApplicationController
  before_action :set_station, only: [:show, :edit, :update, :destroy]

  # GET /stations
  # GET /stations.json
  def index
    @stations = Station.all
  end

  # GET /stations/1
  # GET /stations/1.json
  def show
  end

  # GET /stations/new
  def new
    @station = Station.new
    @station.build_address
  end

  # GET /stations/1/edit
  def edit
  end

  # POST /stations
  # POST /stations.json
  def create
    @station = Station.new(station_params)

    respond_to do |format|
      if @station.save
        format.html { redirect_to @station, notice: 'Station was successfully created.' }
        format.json { render :show, status: :created, location: @station }
      else
        format.html { render :new }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stations/1
  # PATCH/PUT /stations/1.json
  def update
    respond_to do |format|
      if @station.update(station_params)
        format.html { redirect_to @station, notice: 'Station was successfully updated.' }
        format.json { render :show, status: :ok, location: @station }
      else
        format.html { render :edit }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stations/1
  # DELETE /stations/1.json
  def destroy
    @station.destroy
    respond_to do |format|
      format.html { redirect_to stations_url, notice: 'Station was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def suggestion
    url = 'http://api.map.baidu.com/place/v2/suggestion'
    resp = RestClient.get url, {params: {region: '全国', output: 'json', ak: '9c0105d4f31da574429c49cca95c5566', query: params[:term]}}

    result = JSON.parse(resp)['result'].map do |result|
      city = Region.find_by_name_and_level(result['city'], 2)
      area = city.children.find_by_name(result['district'])
      {id: result['name'], text: result['name'], lat: result['location']['lat'], lng: result['location']['lng'], region_id: area.id}
    end
    
    render json: {results: result}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_station
      @station = Station.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def station_params
      ret = params.require(:station).permit(:name, :region_id, address_attributes: [:id, :address, :comment, :lat, :lng])
      ret[:address_attributes].delete(:address) if ret[:address_attributes][:address].blank?
      ret
    end
end
