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

  def receive_message
    @message = Message.new(message_params.merge(ip_address: request.remote_ip))
    @message.device_id = params[:id]
    authorize @message
    if @message.save
      # TODO(chaserx): i think here is where the webhooks sending should happen
      render 'messages/show', status: :created,
                              location: [@message.device, @message]
    else
      render json: @message.errors, status: :unprocessable_entity
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

  def message_params
    params.require(:message).permit(:body).merge(user_id: current_user.id)
  end
end
