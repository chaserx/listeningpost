class WebhooksController < ApplicationController
  before_action :set_webhook, only: [:show, :update, :destroy]

  # GET /webhooks
  # GET /webhooks.json
  def index
    @webhooks = Webhook.where(device_id: params[:device_id])
  end

  # GET /webhooks/1
  # GET /webhooks/1.json
  def show
  end

  # POST /webhooks
  # POST /webhooks.json
  def create
    @webhook = Webhook.new(webhook_params)
    if @webhook.save
      render :show, status: :created, location: @webhook
    else
      render json: @webhook.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /webhooks/1
  # PATCH/PUT /webhooks/1.json
  def update
    if @webhook.update(webhook_params)
      render :show, status: :ok, location: @webhook
    else
      render json: @webhook.errors, status: :unprocessable_entity
    end
  end

  # DELETE /webhooks/1
  # DELETE /webhooks/1.json
  def destroy
    if @webhook.destroy
      head :no_content
    else
      render json: @webhook.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_webhook
    @webhook = Webhook.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def webhook_params
    params[:webhook]
  end
end
