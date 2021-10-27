class SessionsController < ApplicationController
  def login

  end

  def attempt_login
    if params[:email].present? && params[:password].present?
      found_user = User.find_by(email: params[:email])
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end

    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = "You are now logged in."
      redirect_to pokemons_path
    else
      flash.now[:notice] = "Invalid username/password combination."
      render('login')
    end

  end

  def logout
    session[:user_id] = nil
    flash[:notice] = 'Logged out'
    redirect_to(sessions_login_path)
  end
end
