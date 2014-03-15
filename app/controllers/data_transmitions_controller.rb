class DataTransmitionsController < ApplicationController
  before_action :set_data_transmition, only: [:show, :edit, :update, :destroy]

  # GET /data_transmitions
  # GET /data_transmitions.json
  def index
    @data_transmitions = DataTransmition.all
  end

  # GET /data_transmitions/1
  # GET /data_transmitions/1.json
  def show
  end

  # GET /data_transmitions/new
  def new
    @data_transmition = DataTransmition.new
  end

  # GET /data_transmitions/1/edit
  def edit
  end

  # POST /data_transmitions
  # POST /data_transmitions.json
  def create
    @data_transmition = DataTransmition.new(data_transmition_params)

    respond_to do |format|
      if @data_transmition.save
        format.html { redirect_to @data_transmition, notice: 'Data transmition was successfully created.' }
        format.json { render action: 'show', status: :created, location: @data_transmition }
      else
        format.html { render action: 'new' }
        format.json { render json: @data_transmition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /data_transmitions/1
  # PATCH/PUT /data_transmitions/1.json
  def update
    respond_to do |format|
      if @data_transmition.update(data_transmition_params)
        format.html { redirect_to @data_transmition, notice: 'Data transmition was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @data_transmition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data_transmitions/1
  # DELETE /data_transmitions/1.json
  def destroy
    @data_transmition.destroy
    respond_to do |format|
      format.html { redirect_to data_transmitions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_data_transmition
      @data_transmition = DataTransmition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def data_transmition_params
      params.require(:data_transmition).permit(:firefly_id, :sent_at, :hour_meter, :high_temp, :low_temp, :min_voltage, :max_voltage, :error_code)
    end
end
