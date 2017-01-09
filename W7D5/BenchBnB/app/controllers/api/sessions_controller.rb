class Api::SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(user_params[:username],
                                     user_params[:password])

    if @user
      log_in(@user)
      render :show
    else
      render json: 'Invalid credentials', status: 404
    end
  end

  def destroy
    if current_user
      log_out
      render json: {}
    else
      render json: 'Not logged in', status: 404
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
