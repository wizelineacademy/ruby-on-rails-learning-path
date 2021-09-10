class Api::V1::AccessController < ApplicationController
  def authenticate
    if params[:email].present? && params[:password].present?
      found_user = Player.where(:email => params[:email]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end

    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = "You are now logged in."
    else
      flash.now[:notice] = "Invalid username/password combination."
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = 'Logged out'
  end
end
