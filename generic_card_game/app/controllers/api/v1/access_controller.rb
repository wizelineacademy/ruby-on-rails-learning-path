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
      render json: {
        logged_in: true,
        user: authorized_user
      }
    else
      flash.now[:notice] = "Invalid username/password combination."
      render json: {
        logged_in: false,
        message: 'no such user'
      }
    end
  end

  def is_logged_in?
    if session[:user_id] && (current_user = Player.find(session[:user_id]))
      render json: {
        logged_in: true,
        user: current_user
      }
    else
      render json: {
        logged_in: false,
        message: 'no such user'
      }
    end
  end

  def logout
    session[:user_id] = nil
    render json: {
      logged_in: false,
      message: 'no such user'
    }
  end
end
