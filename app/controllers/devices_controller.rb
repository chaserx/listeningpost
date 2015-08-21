class DevicesController < ApplicationController
  before_action :authenticate
  before_action :set_device, only: [:show, :update, :destroy]

  # GET /devices
  # GET /devices.json
  def index
    @devices = Device.all # one day reduce by current user
  end

  # GET /devices/1
  # GET /devices/1.json
  def show
  end

  # POST /devices
  # POST /devices.json
  def create
    @device = Device.new(device_params)
    @device.user_id = @current_user.id
    if @device.save
      render :show, status: :created, location: @device
    else
      render json: @device.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /devices/1
  # PATCH/PUT /devices/1.json
  def update
    if @device.update(device_params)
      render :show, status: :ok, location: @device
    else
      render json: @device.errors, status: :unprocessable_entity
    end
  end

  # DELETE /devices/1
  # DELETE /devices/1.json
  def destroy
    if @device.destroy
      head :no_content
    else
      render json: @device.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_device
    @device = Device.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def device_params
    params[:device].permit(:name)
  end
end
