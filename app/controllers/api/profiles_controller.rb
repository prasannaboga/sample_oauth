class Api::ProfilesController < Api::BaseController

  before_action :set_profile

  def show
    render json: @profile
  end

  private

  def set_profile
    @profile = current_user.profile
  end
end
