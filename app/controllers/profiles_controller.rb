class ProfilesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_profile

  def show
    @profile_nav_link_class = 'active'
  end

  def edit
    @profile_nav_link_class = 'active'
  end

  def set_profile
    @profile = current_user.profile
  end
end
