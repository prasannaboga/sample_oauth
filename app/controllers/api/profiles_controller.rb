class Api::ProfilesController < Api::BaseController

  before_action :set_profile

  def show
    render json: @profile
  end

  def update
    update_params = {first_name: Faker::Name.first_name,
                     last_name: Faker::Name.last_name,
                     dob: Faker::Date.birthday(18, 65),
                     location: Faker::Address.city}
    if @profile.update(update_params)
      render_success()
    else
      render_unprocessable_entity(@profile)
    end
  end

  private

  def set_profile
    @profile = current_user.profile
  end
end
