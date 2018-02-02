class WebhooksController < ApplicationController
  skip_before_action :authenticate_user!
  
  def github
    Rails.logger.debug params
    render json: :ok
  end
end
