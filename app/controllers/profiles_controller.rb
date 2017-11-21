class ProfilesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_profile, except: [:public_profile]

  def show

  end

  def edit

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

  def public_profile
    profile_id = params[:friendly_id].split('-')
    @profile = Profile.find_by(id: profile_id)
    page_meta_tags(title: @profile.name + '\'s Profile',
                   keywords: "#{@profile.name}, #{@profile.location}, #{@profile.dob.in_time_zone.to_formatted_s(:dob_mdy)}",
                   description: "#{@profile.name}, #{@profile.location}, #{@profile.dob.in_time_zone.to_formatted_s(:dob_mdy)}")
  end

  private

  def set_profile
    @profile = current_user.profile
  end
end
