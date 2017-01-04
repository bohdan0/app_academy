class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(username: params[:username], password: params[:password])
    if user.save
      redirect_to root_url
    else
      redirect_to new_user_url
    end
  end

end
