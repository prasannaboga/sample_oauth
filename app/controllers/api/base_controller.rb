module Api
  class BaseController < ApplicationController

    skip_before_action :verify_authenticity_token
    before_action :authenticate_user!


    rescue_from ActiveRecord::RecordNotFound do |e|
      render_record_error(e.message, :not_found)
    end

    def doorkeeper_unauthorized_render_options(error: nil)
      render_error('User is not authenticated!', :unauthorized)
    end

    private

    def authenticate_user!
      if doorkeeper_token
        Thread.current[:current_user] = User.find(doorkeeper_token.resource_owner_id)
      end

      return if current_user

      render_error('User is not authenticated!', :unauthorized)
    end

    def current_user
      Thread.current[:current_user]
    end

    def render_success(obj = {})
      response = {success: true}
      if !obj.empty?
        response.merge!(obj)
      end
      render json: response
    end

    def render_unprocessable_entity(record)
      render_record_error(record, :unprocessable_entity)
    end

    def render_record_error(record, status_sym)
      render_error(record.errors.full_messages, status_sym)
    end

    def render_error(obj, st_sym)
      error_messages = obj.is_a?(Array) ? obj : [obj.to_s]
      logger.error(error_messages)
      render json: {errors: error_messages}, status: st_sym
    end
  end
end
