class AccessController < ApplicationController

  layout 'application'

  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def menu
  end

  def login
  end

  def attempt_login
    if params[:email].present? && params[:password].present?
      found_user = Maestro.where(:email => params[:email]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end

    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = "You are now logged in"
      redirect_to(admin_path)
    else
      flash.now[:notice] = "Invalid email/password combination."
      render('login')
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = 'Logged out'
    redirect_to(access_login_path)
  end

end
