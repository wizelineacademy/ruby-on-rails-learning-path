class Api::V1::AccessController < ApplicationController
  def authenticate
    if params[:user] && params[:user][:email].present? && params[:user][:password].present?
      found_user = Player.find_by_email(params[:user][:email])
      if found_user
        authorized_user = found_user.authenticate(params[:user][:password])
      end
    end

    if authorized_user
      session[:user_id] = authorized_user.id
      render json: {
        logged_in: true,
        user: authorized_user
      }
    else
      render json: {
        logged_in: false,
        message: 'Invalid email/password combination.'
      }
    end
  end

  def new_user
    @user = Player.new(user_params)
    message = nil;
    begin
      if @user.save
        session[:user_id] = @user.id
        return render json: {
          logged_in: true,
          user: @user
        }
      else
        message = (@user.errors.first.attribute.to_s + " " + @user.errors.first.message) || 'Cannot create user'
      end
    rescue StandardError => e
      if(e.message.to_s.include?("UniqueViolation") && (e.message.to_s.include?(@user.email)))
        message = 'An account with this email already exists.'
      elsif
        message = e.message
      end

    end

    render json: {
      logged_in: false,
      message: message
    }
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

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
