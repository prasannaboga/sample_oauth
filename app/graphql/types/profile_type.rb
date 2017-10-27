Types::ProfileType = GraphQL::ObjectType.define do
  name 'Profile'
  description 'User Profile Details'
  field :id, !types.ID
  field :first_name, !types.String
  field :last_name, !types.String
  field :dob, !types.String
  field :location, !types.String
  field :user, Types::UserType
end
