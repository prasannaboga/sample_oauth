class WebhooksController < ApplicationController
  def github
    Rails.logger.debug params
    render json: :ok
  end
end
