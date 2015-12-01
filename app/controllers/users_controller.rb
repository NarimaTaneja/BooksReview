class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def show
    @user = User.where(auth_token: cookies[:auth_token])
  end

  def create 
  	@user = User.new(user_params)
  	if @user.save
  		session[:user_id] = @user_id
  		redirect_to '/'
  	else
  		redirect_to '/login'
  	end
  end

  def edit
     @user = User.where(auth_token: cookies[:auth_token])
  end

  def update
    @user = User.where(auth_token: cookies[:auth_token])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end


  def user_params
  	params.require(:user).permit(:first_name,:last_name,:email,:password,:image)
  end
end
