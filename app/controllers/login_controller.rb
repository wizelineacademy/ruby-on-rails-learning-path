class LoginController < ApplicationController

  def is_email_valid?(email)
    email =~ /^(.+)@(.+)$/
  end

  def auth
    if is_user_already_logged
      redirect_to(root_path)
    end
  end

  def register

  end

  def logout
    session[:user_id] = nil
    redirect_to(root_path)
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

  def login
    flash[:error] = nil
    email = params[:email]
    password = params[:password]
    flash[:email] = email
    flash[:password] = password
    data = [email, password]
    if data.include?(nil) || data.include?("")
      flash[:error] = "Please fill out all the form"      
    else
      if is_email_valid?(email)
        user = User.find_by email: email
        if user.nil? || user.authenticate(password) == false
          flash[:error] = "Incorrect credentials" 
        else
          session[:user_id] = user.id
          redirect_to(root_path)
          return 
        end
      else
        flash[:error] = "Please use a valid email"      
      end
    end
    render :auth
  end

end
