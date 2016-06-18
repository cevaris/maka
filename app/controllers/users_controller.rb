class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    @user_activities = @user.user_activities
    
  end

  private
    def set_user
      @user = User.find_by_username(params[:username])
    end
end
