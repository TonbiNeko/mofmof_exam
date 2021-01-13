class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  # GET /properties
  # GET /properties.json
  def index
    @properties = Property.all
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
    @nearest_stations = @property.nearest_stations
  end

  # GET /properties/new
  def new
    @property = Property.new
    2.times { @property.nearest_stations.build }
  end

  # GET /properties/1/edit
  def edit
    if @property.nearest_stations.blank?
      2.times { @property.nearest_stations.build }
      @nearest_stations = @property.nearest_stations
      
    elsif @property.nearest_stations.count >= 1
      @property.nearest_stations.build
    end
  end

  # POST /properties
  # POST /properties.json
  def create
    @property = Property.new(property_params)

    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: '物件を登録しました' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: '物件を編集しました' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: '物件を削除しました' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_property
    @property = Property.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def property_params
    params.require(:property).permit(
      :name,
      :rent,
      :address,
      :age,
      :remarks,
      nearest_stations_attributes: [
        :train_line,
        :station_name,
        :walking_time,
        :property_id,
        :id,
        :_destroy,
      ],
    )
  end
end
