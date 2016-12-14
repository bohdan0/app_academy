class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      login(user)
      redirect_to user_url(user)
    else
      flash.now[:errors] = user.errors.full_messages
      render :new
    end
  end

  def show
    if current_user
      @user = current_user
    else
      redirect_to new_sessions_url
    end
  end

  def destroy

  end

  private
  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end
