class CallbacksController < ApplicationController
  before_action :set_callback, only: [:show, :update, :destroy]

  # GET /callbacks
  # GET /callbacks.json
  def index
    @callbacks = Callback.where(device_id: params[:device_id])
  end

  # GET /callbacks/1
  # GET /callbacks/1.json
  def show
  end

  # POST /callbacks
  # POST /callbacks.json
  def create
    @callback = Callback.new(callback_params)

    if @callback.save
      render :show, status: :created
    else
      render json: @callback.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /callbacks/1
  # PATCH/PUT /callbacks/1.json
  def update
    if @callback.update(callback_params)
      render :show, status: :ok
    else
      render json: @callback.errors, status: :unprocessable_entity
    end
  end

  # DELETE /callbacks/1
  # DELETE /callbacks/1.json
  def destroy
    if @callback.destroy
      head :no_content
    else
      render json: @callback.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_callback
    @callback = Callback.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def callback_params
    params.require(:callback).permit(:url, :device_id)
  end
end
