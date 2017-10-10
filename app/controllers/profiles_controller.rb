class ProfilesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_profile

  def show

  end

  def edit

  end

  def set_profile
    @profile = current_user.profile
  end
end
