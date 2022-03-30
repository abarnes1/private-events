class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    # prevent accessing another user's page because the create event button is not protected
    redirect_to user_path(current_user.id) if params[:id] != current_user.id.to_s

    @user = User.find(current_user.id)
  end
end
