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

  private

  def set_device
    @device = Device.find(params[:device_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_message
    @message = Message.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list
  # through.
  def message_params
    params.require(:message).permit(:body).merge(user_id: current_user.id)
  end
end
