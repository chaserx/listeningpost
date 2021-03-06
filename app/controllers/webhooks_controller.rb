class WebhooksController < ApplicationController
  before_action :authenticate
  before_action :set_device
  before_action :set_webhook, only: [:show, :update, :destroy]

  # GET /webhooks.json
  def index
    @webhooks = policy_scope(Webhook).for_device(@device)
  end

  # GET /webhooks/1.json
  def show
    authorize @webhook
  end

  # POST /webhooks.json
  def create
    @webhook = Webhook.new(webhook_params)
    authorize @webhook
    if @webhook.save
      render :show, status: :created, location: [@device, @webhook]
    else
      render json: @webhook.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /webhooks/1.json
  def update
    authorize @webhook
    if @webhook.update(webhook_params)
      render :show, status: :ok, location: [@device, @webhook]
    else
      render json: @webhook.errors, status: :unprocessable_entity
    end
  end

  # DELETE /webhooks/1.json
  def destroy
    authorize @webhook
    if @webhook.destroy
      head :no_content
    else
      render json: @webhook.errors, status: :unprocessable_entity
    end
  end

  private

  def set_device
    @device = Device.find(params[:device_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_webhook
    @webhook = Webhook.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list
  # through.
  def webhook_params
    params.require(:webhook).permit(:url, :request_type, :message_body).
      merge(device_id: params[:device_id], user_id: current_user.id)
  end
end
