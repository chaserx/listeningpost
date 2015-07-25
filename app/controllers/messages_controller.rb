class MessagesController < ApplicationController
  respond_to :json
  before_action :set_message, only: [:show, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.where(device_id: params[:device_id])
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)
    @message.device_id = params[:id] || params[:device_id]
    respond_to do |format|
      if @message.save
        format.json { render :show, status: :created, location: [@message.device, @message] }
      else
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_message
    @message = Message.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def message_params
    params.require(:message).permit(:body)
  end
end
