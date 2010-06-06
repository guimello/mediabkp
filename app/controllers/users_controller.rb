class UsersController < ApplicationController
  
  before_filter :get_user
  
  def get_user
    if user_signed_in?      
      current_user if User.find(params[:id]) == current_user
    else
      redirect_to root_url
    end
  end
end
