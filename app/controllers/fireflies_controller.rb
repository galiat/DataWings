class FirefliesController < ApplicationController
  before_action :set_firefly, only: [:show, :edit, :update, :destroy]

  # GET /fireflies
  # GET /fireflies.json
  def index
    @fireflies = Firefly.all
  end

  # GET /fireflies/1
  # GET /fireflies/1.json
  def show
  end

  # GET /fireflies/new
  def new
    @firefly = Firefly.new
  end

  # GET /fireflies/1/edit
  def edit
  end

  # POST /fireflies
  # POST /fireflies.json
  def create
    @firefly = Firefly.new(firefly_params)

    respond_to do |format|
      if @firefly.save
        format.html { redirect_to @firefly, notice: 'Firefly was successfully created.' }
        format.json { render action: 'show', status: :created, location: @firefly }
      else
        format.html { render action: 'new' }
        format.json { render json: @firefly.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fireflies/1
  # PATCH/PUT /fireflies/1.json
  def update
    respond_to do |format|
      if @firefly.update(firefly_params)
        format.html { redirect_to @firefly, notice: 'Firefly was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @firefly.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fireflies/1
  # DELETE /fireflies/1.json
  def destroy
    @firefly.destroy
    respond_to do |format|
      format.html { redirect_to fireflies_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_firefly
      @firefly = Firefly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def firefly_params
      params.require(:firefly).permit(:device_id, :hospital_id, :sponsor_id)
    end
end
