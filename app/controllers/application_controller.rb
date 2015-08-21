class ApplicationController < ActionController::Base
  include Knock::Authenticable

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  protect_from_forgery with: :null_session, if: proc { |c|
    c.request.format.json?
  }

  rescue_from ActiveRecord::RecordNotFound do
    render json: {error: '404 Not Found'}, status: :not_found
  end
end
