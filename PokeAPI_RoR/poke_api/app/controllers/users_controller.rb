class UsersController < ApplicationController
  before_action :confirm_logged_in, except: %i[new create]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'User created successfully.'
      redirect_to(access_login_path)
    else
      render('new')
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to(access_logout_path(update: true))
    else
      render(edit_user_path)
    end
  end

  def delete
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to(access_logout_path(delete: true))
  end

  private

  def user_params
    params.require(:user).permit(
      :username,
      :email,
      :password
    )
  end
end
