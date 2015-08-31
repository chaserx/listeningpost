class DevicesController < ApplicationController
  before_action :authenticate
  before_action :set_device, only: [:show, :update, :destroy]

  # GET /devices.json
  def index
    @devices = policy_scope(Device)
  end

  # GET /devices/1.json
  def show
    authorize @device
  end

  # POST /devices.json
  def create
    @device = Device.new(device_params)
    @device.user = current_user
    authorize @device
    if @device.save
      render :show, status: :created, location: @device
    else
      render json: @device.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /devices/1.json
  def update
    authorize @device
    if @device.update(device_params)
      render :show, status: :ok, location: @device
    else
      render json: @device.errors, status: :unprocessable_entity
    end
  end

  # DELETE /devices/1.json
  def destroy
    authorize @device
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

  # Never trust parameters from the scary internet, only allow the white list
  # through.
  def device_params
    params[:device].permit(:name)
  end
end
