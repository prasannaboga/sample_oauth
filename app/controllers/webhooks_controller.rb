class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!, raise: false

  def github
    Rails.logger.debug params
    render json: params
  end
end
