class AccessController < ApplicationController
  
  layout 'user'

  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]
  
  def menu
  end

  def login
  end

  def user_menu
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = User.where(:username => params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end

    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = "You are now logged in."
      authorized_user.user_type.user_type == "admin" ? redirect_to(admin_path) : redirect_to(user_path)
    else
      flash.now[:notice] = "Invalid username/password combination"
      render('login')
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to(access_login_path)
  end
end
