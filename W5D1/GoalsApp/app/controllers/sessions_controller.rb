class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_credentials(session_params[:username], session_params[:password])

    if @user
      redirect_to user_url(@user)
    else
      flash[:error] = ["invalid pw or usename"]
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to new_session_url
  end

  private

  def session_params
    params.require(:user).permit(:username, :password)
  end
end
