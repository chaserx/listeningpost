class UsersController < ApplicationController
  before_action :authenticate, only: [:show, :update]
  before_action :set_user, only: [:show, :update]

  def create
    skip_authorization
    @user = User.new(user_params)
    if @user.save
      render :show, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def show
    authorize @user
  end

  def update
    authorize @user
    if @user.update(user_params)
      render :show, status: :ok, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
