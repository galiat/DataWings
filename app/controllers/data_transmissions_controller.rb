class DataTransmissionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create_by_sms
  before_action :set_data_transmission, only: [:show, :edit, :update, :destroy]

  # GET /data_transmissions
  # GET /data_transmissions.json
  def index
    @data_transmissions = DataTransmission.all
  end

  # GET /data_transmissions/1
  # GET /data_transmissions/1.json
  def show
  end

  # GET /data_transmissions/new
  def new
    @data_transmission = DataTransmission.new
  end

  # GET /data_transmissions/1/edit
  def edit
  end

  #{"ToCountry"=>"US", "ToState"=>"NH", "SmsMessageSid"=>"SM251ef298f7216216c75cfbe4a26f6c7f", "NumMedia"=>"0", "ToCity"=>"CHESTERFIELD", "FromZip"=>"01301",
  #{}"SmsSid"=>"SM251ef298f7216216c75cfbe4a26f6c7f", "FromState"=>"MA", "SmsStatus"=>"received", "FromCity"=>"GREENFIELD", "Body"=>"Wings", "FromCountry"=>"US",
  #{}"To"=>"+16035925883", "ToZip"=>"03466", "MessageSid"=>"SM251ef298f7216216c75cfbe4a26f6c7f", "AccountSid"=>"AC7dcea6002aae538d6f20e7544f6dae39",
  #"From"=>"+14135121397", "ApiVersion"=>"2010-04-01"}

  def create_by_sms
    #body = "firefly_id 1, sent_at 2014-03-16T00:49:00.000Z, hour_meter 12, high_temp 666, low_temp 2,min_voltage 112, max_voltage 121, error_code"
    #body = params[body]
    body = params[:Body]

    arr = body.split(',').map{|e| e.strip.split(' ')}
    hash = Hash[arr]
    @data_transmission = DataTransmission.new(hash)
    @data_transmission.save
  end

  # POST /data_transmissions
  # POST /data_transmissions.json
  def create
    @data_transmission = DataTransmission.new(data_transmission_params)

    respond_to do |format|
      if @data_transmission.save
        format.html { redirect_to @data_transmission, notice: 'Data transmission was successfully created.' }
        format.json { render action: 'show', status: :created, location: @data_transmission }
      else
        format.html { render action: 'new' }
        format.json { render json: @data_transmission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /data_transmissions/1
  # PATCH/PUT /data_transmissions/1.json
  def update
    respond_to do |format|
      if @data_transmission.update(data_transmission_params)
        format.html { redirect_to @data_transmission, notice: 'Data transmission was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @data_transmission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data_transmissions/1
  # DELETE /data_transmissions/1.json
  def destroy
    @data_transmission.destroy
    respond_to do |format|
      format.html { redirect_to data_transmissions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_data_transmission
      @data_transmission = DataTransmission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def data_transmission_params
      params.require(:data_transmission).permit(:firefly_id, :sent_at, :hour_meter, :high_temp, :low_temp, :min_voltage, :max_voltage, :error_code)
    end
end
