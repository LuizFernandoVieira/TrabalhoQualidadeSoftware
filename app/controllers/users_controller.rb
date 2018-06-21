class UsersController < ApplicationController
  def index
  end

  def consult_users
    @users = User.where(["nickname LIKE ?", "%#{params[:nickname]}%"])
  end
end
