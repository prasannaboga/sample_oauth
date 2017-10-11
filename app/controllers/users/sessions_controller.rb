class Users::SessionsController < Devise::SessionsController
  def new
    self.resource = resource_class.new(sign_in_params)
    store_location_for(resource, session[:return_to] || params[:redirect_to])
    super
  end
end

