class AdminController < ApplicationController

  before_action :authenticate_user!
  before_action :authenticate_admin!

  def show

  end

  private

  def authenticate_admin!
    unless (1..3).include?(current_user.id)
      flash[:alert] = 'Your not admin!'
      redirect_to root_path
    end
  end

end
