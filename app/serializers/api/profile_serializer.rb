class Api::ProfileSerializer < ActiveModel::Serializer
  attributes :id,
             :user_id,
             :first_name,
             :last_name,
             :dob,
             :location
end
