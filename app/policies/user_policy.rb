class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @model = model
  end

  def create?
    true
  end

  def show?
    @model == @current_user
  end

  def update?
    @model == @current_user
  end
end
