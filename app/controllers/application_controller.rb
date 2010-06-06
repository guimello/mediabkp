# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password
  
  before_filter :get_user
  
  def get_user
    return true if devise_controller?
    if user_signed_in?      
      @user = current_user if User.find(params[:user_id]) == current_user
    else
      redirect_to root_url
    end
  end
  
  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      user_albums_url(current_user)
    else
      super
    end
  end
  
  layout :layout_by_resource
  
  def layout_by_resource
    return "sessions" if devise_controller?
    "simple"    
  end

end
