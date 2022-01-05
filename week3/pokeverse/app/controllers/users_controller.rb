class UsersController < ApplicationController
  
  layout 'user'

  before_action :confirm_logged_in
  
  def index
    @users = User.sorted
  end

  def new
    normal = UserType.normal
    @user = User.new(:user_type => normal)
    @user_types = user_types_for_select
  end

  def create
    @user = User.new(user_params)
    @user.user_type = UserType.find(params[:user][:user_type])
    if @user.save
      flash[:notice] = "User created successfully"
      redirect_to(users_path)
    else
      @user_types = user_types_for_select
      render('new')
    end
  end

  def edit
    @user = User.find(params[:id])
    @user_types = user_types_for_select
  end

  def update
    @user = User.find(params[:id])
    @user.user_type = UserType.find(params[:user][:user_type])
    if @user.update(user_params)
      flash[:notice] = "User updated successfully"
      redirect_to(users_path)
    else
      @user_types = user_types_for_select
      render('edit')
    end
  end

  def delete
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User #{@user.name} deleted successfully"
    redirect_to(users_path)
  end

  private

    def user_params
      params.require(:user).permit(
        :first_name,
        :last_name,
        :username,
        :email,
        :password
      )
    end

    def user_types_for_select
      UserType.order("user_type ASC").map do |user_type|
        [user_type.user_type, user_type.id]
      end
    end

end
