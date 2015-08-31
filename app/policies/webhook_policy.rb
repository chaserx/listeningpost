class WebhookPolicy < ApplicationPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @model = model
  end

  def create?
    @model.user == @current_user
  end

  def show?
    @model.user == @current_user
  end

  def update?
    @model.user == @current_user
  end

  def destroy?
    @model.user == @current_user
  end

  class Scope < Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.where(user: @user)
    end
  end
end
