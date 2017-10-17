class Api::ProfileSerializer < ActiveModel::Serializer
  attributes :id,
             :user_id,
             :name,
             :first_name,
             :last_name,
             :dob,
             :location,
             :small_avatar,
             :large_avatar

  def small_avatar
    object.avatar('720x480')
  end

  def large_avatar
    object.avatar('1200x800')
  end

end
