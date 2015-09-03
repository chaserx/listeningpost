class MessagePolicy < ApplicationPolicy
  attr_reader :current_user, :model

  def initialize current_user, model
    @current_user = current_user
    @model = model
  end

  def receive_message?
    @model.user == @current_user
  end

  def show?
    @model.user == @current_user
  end

  class Scope < Scope
    attr_reader :user, :scope

    def initialize user, scope
      @user = user
      @scope = scope
    end

    def resolve
      scope.where(user: @user)
    end
  end
end
