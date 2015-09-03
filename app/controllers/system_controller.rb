class SystemController < ApplicationController
  def ping
    render plain: 'PONG'
  end
end
