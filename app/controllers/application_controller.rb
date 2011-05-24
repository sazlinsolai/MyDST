class ApplicationController < ActionController::Base
  protect_from_forgery
  layout Proc.new { |controller| controller.request.xhr? ? 'hijax_page' : 'application' }
  
  helper :all
  helper_method :current_user_session, :current_user
  before_filter :authenticate_user!, :unless => :devise_controller?


  protected

  def admin_required
    return access_denied unless user_signed_in? and current_user.admin?
  end

  private

  def store_location
    flash[:notice] = "You must be logged in to access this page"
    session[:return_to] = request.request_uri
  end

  def access_denied
    store_location
    redirect_to new_user_session_path
    return false
  end

end
