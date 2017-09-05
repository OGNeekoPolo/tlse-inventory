class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  helper_method :current_user

  def current_user
    @current_user ||= Employee.find(session[:current_user_id]) if session[:current_user_id]
  end

  def authenticate_user!
    if user_signed_in? != true
      respond_to do |format|
        format.html {redirect_to login_path}
        format.json {render json: {error: "Restricted"}, status: :unauthorized}
      end
    end
  end

  def user_signed_in?
   current_user.present?
  end

  def loggedin
    if user_signed_in? == true
      redirect_to products_path
    end
  end

end
