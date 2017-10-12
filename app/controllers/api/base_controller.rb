module Api
  class BaseController < ApplicationController

    before_action :authenticate_user!

    rescue_from ActiveRecord::RecordNotFound do |e|
      render json: errors_json(e.message), status: :not_found
    end

    def doorkeeper_unauthorized_render_options(error: nil)
      {json: {error: 'Not authorized'}}
    end

    private

    def authenticate_user!
      if doorkeeper_token
        Thread.current[:current_user] = User.find(doorkeeper_token.resource_owner_id)
      end

      return if current_user

      render json: {errors: ['User is not authenticated!']}, status: :unauthorized
    end

    def current_user
      Thread.current[:current_user]
    end

    def errors_json(messages)
      {errors: [*messages]}
    end
  end
end
