class UsersController < ApplicationController
  def menu
    
  end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
    if @user.save
      flash[:notice] = 'Success!'
      redirect_to pokemons_path
    else
      flash[:error] = @user.errors
      render 'menu'
    end
	end
  
  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end    
end
