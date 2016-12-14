class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  # def login(user)
  #   session_token = user.reset_token!
  #   session[:session_token] = session_token
  # end

  def login(user)
    # session_token = MultiSession.find_by(user_id: user.id).session_token
    session_token = User.generate_token_session
    MultiSession.create(user_id: user.id, session_token: session_token)
    session[:session_token] = session_token
  end

  def current_user
    user = MultiSession.find_by(session_token: session[:session_token])
    return nil if user.nil?
    @current_user ||= MultiSession.find_by(session_token: session[:session_token]).user
  end

  def already_logged_in
    redirect_to cats_url if current_user
  end

  def validate_ownership
    cat = Cat.find(params[:id])
    unless current_user && current_user.id == cat.owner.id
      redirect_to cats_url
    end
  end

  def validate_ownership_for_rental
    cat_rental_request = CatRentalRequest.find(params[:id])
    unless current_user && current_user.id == cat_rental_request.cat.owner.id
      redirect_to cats_url
    end
  end
end
