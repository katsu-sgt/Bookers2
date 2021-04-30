class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end 
  
  def index
    @users = User.all
  end
  
  
  
  private
  
  def user_params
    prams.require(:user).permit(:profile_image, :introduction, :name )
  end 
  
end
