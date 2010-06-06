class SiteController < ApplicationController
  skip_before_filter :get_user
  before_filter :logged_in?
  
  def logged_in?
    redirect_to user_albums_url(current_user) if user_signed_in?
  end
  
  def main
    
  end
end
