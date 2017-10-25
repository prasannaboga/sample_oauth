class Admin::UsersController < AdminController

  before_action :set_users, only: [:index]
  before_action :set_user, only: [:oauth_access_tokens]

  def index

  end

  def oauth_access_tokens
    @oauth_access_tokens = @user.oauth_access_tokens
  end

  private

  def set_users
    @users = User.includes(:profile).all
  end

  def set_user
    @user = User.find(params[:id])
  end
end
