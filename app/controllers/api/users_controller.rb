class Api::UsersController < Api::BaseController

  def show
    render json: current_resource_owner
  end

  private

  def current_resource_owner
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
end
