class MessagesController < ApplicationController
  before_action :authenticate
  before_action :set_message, only: [:show]
  before_action :set_device

  # GET /messages.json
  def index
    @messages = policy_scope(Message).for_device(@device)
  end

  # GET /messages/1.json
  def show
    authorize @message
  end

  # POST /messages.json
  def create
    @message = Message.new(message_params.merge(ip_address: request.remote_ip))
    @message.device = @device
    authorize @message
    if @message.save
      # TODO(chaserx): i think here is where the webhooks sending should happen
      render :show, status: :created, location: [@message.device, @message]
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  private

  def set_device
    @device = Device.find(params[:device_id])
  end

  def set_message
    @message = Message.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list
  # through.
  def message_params
    params.require(:message).permit(:subject, :body).
                             merge(user_id: current_user.id)
  end
end
