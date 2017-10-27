Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  field :profile, Types::ProfileType do
    argument :id, !types.ID
    resolve ->(obj, args, ctx) {
      Profile.find(args['id'])
    }
  end
end
