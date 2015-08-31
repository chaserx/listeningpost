class ApplicationController < ActionController::Base
  include Knock::Authenticable
  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  if proc { |c| c.request.format.json? }
    protect_from_forgery with: :null_session
  end

  rescue_from ActiveRecord::RecordNotFound do
    render json: {error: '404 Not Found'}, status: :not_found
  end

  rescue_from Pundit::NotAuthorizedError do
    render json: {error: 'You are not authorized to perform this action.'},
      status: :unauthorized
  end
end
