class LoginController < ApplicationController

  def is_email_valid?(email)
    email =~ /^(.+)@(.+)$/
  end

  def auth

  end

  def register

  end

  def new
    flash[:error] = nil
    flash[:success] = nil 
    email = params[:email]
    user_name = params[:user_name]
    password = params[:password]
    flash[:email] = email
    flash[:user_name] = user_name
    flash[:password] = password
    data = [email, user_name, password]
    if data.include?(nil) || data.include?("")
      flash[:error] = "Please fill out all the form"      
    else
      if is_email_valid?(email)
        user = User.new
        user.email = email
        user.password = password
        user.user_name = user_name
        unless user.save
          flash[:error] = "Please try again" 
        else
          flash[:success] = true
        end
      else
        flash[:error] = "Please use a valid email"      
      end
    end
    render :register
  end
end
