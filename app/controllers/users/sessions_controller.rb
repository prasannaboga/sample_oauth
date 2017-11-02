class Users::SessionsController < Devise::SessionsController
  def new
    self.resource = resource_class.new(sign_in_params)
    store_location_for(resource, session[:return_to] || params[:redirect_to])
    page_meta_tags(title: 'Login',
                   keywords: 'Login, Signin, Sample, Oauth',
                   description: 'User login page for application')
    super
  end
end

