class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def show
    @user = User.find(session[:user_id])
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
     @user = User.find(session[:user_id])
  end

  def update
    @user = User.find(session[:user_id])
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
