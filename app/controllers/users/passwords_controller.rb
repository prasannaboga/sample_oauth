class Users::PasswordsController < Devise::PasswordsController

  def new
    page_meta_tags(title: 'Forget Password',
                   keywords: 'Forget Password, Set Password, Sample, Oauth',
                   description: 'Reset your password!')

    super
  end

  protected
  def after_resetting_password_path_for(resource)
    signed_in_root_path(resource)
  end
end
