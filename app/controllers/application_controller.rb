class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

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

  protected

  def after_sign_in_path_for(resource)
    session[:user_id] = resource.id
    sign_in_url = new_user_session_url
    if request.referer == sign_in_url
      super
    else
      stored_location_for(resource) || request.referer || root_path
    end
  end
end

