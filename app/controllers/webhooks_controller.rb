class WebhooksController < ApplicationController
  before_action :set_webhook, only: [:show, :update, :destroy]

  # GET /webhooks
  # GET /webhooks.json
  def index
    @webhooks = Webhook.all
  end

  # GET /webhooks/1
  # GET /webhooks/1.json
  def show
  end

  # POST /webhooks
  # POST /webhooks.json
  def create
    @webhook = Webhook.new(webhook_params)

    respond_to do |format|
      if @webhook.save
        format.json { render :show, status: :created, location: @webhook }
      else
        format.json { render json: @webhook.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /webhooks/1
  # PATCH/PUT /webhooks/1.json
  def update
    respond_to do |format|
      if @webhook.update(webhook_params)
        format.json { render :show, status: :ok, location: @webhook }
      else
        format.json { render json: @webhook.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /webhooks/1
  # DELETE /webhooks/1.json
  def destroy
    @webhook.destroy
    respond_to do |format|
      format.json { head :no_content }
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
