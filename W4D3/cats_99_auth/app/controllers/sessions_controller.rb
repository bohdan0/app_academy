class SessionsController < ApplicationController
  before_action :already_logged_in, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by_credentials(session_params[:username], session_params[:password])
    if user
      login(user)
      redirect_to(cats_url)
    else
      flash.now[:errors] = ["Wrong password/user"]
      render :new
    end
  end

  def destroy
    if current_user 
      user_session = MultiSession.find_by(session_token: session[:session_token])
      user_session.session_token = User.generate_token_session
      user_session.save
      session[:session_token] = nil
    end

    redirect_to new_sessions_url
  end
  #
  # def destroy
  #   if current_user
  #     current_user.reset_token!
  #     session[:session_token] = nil
  #   end
  #
  #   redirect_to new_sessions_url
  # end

  private
  def session_params
    params.require(:user).permit(:username, :password)
  end
end
