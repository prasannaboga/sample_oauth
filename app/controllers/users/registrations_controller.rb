class Users::RegistrationsController < Devise::RegistrationsController

  def new
    page_meta_tags(title: 'Registration',
                   keywords: 'Registration, New User, Signup, Join, Sample, Oauth',
                   description: 'Become a user registration now')
    super
  end

  protected
  def after_sign_up_path_for(resource)
    signed_in_root_path(resource)
  end

  def after_update_path_for(resource)
    signed_in_root_path(resource)
  end
end
