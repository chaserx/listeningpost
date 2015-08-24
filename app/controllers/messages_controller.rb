class MessagesController < ApplicationController
  before_action :authenticate
  before_action :set_message, only: [:show, :destroy]

  # GET /messages.json
  def index
    @messages = Message.where(device_id: params[:device_id])
  end

  # GET /messages/1.json
  def show
  end

  # POST /messages.json
  def create
    @message = Message.new(message_params.merge(ip_address: request.remote_ip))
    @message.device_id = params[:id] || params[:device_id]

    if @message.save
      # NOTE(chaserx): i think here is where the webhooks sending should happen
      render :show, status: :created, location: [@message.device, @message]
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_message
    @message = Message.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def message_params
    params.require(:message).permit(:body).merge(user_id: current_user.id)
  end
end
