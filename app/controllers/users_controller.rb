class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end 
  
  
  def index
  end
  
  
  
  
  
  private
  
  def user_params
    params.require(:user).permit(:profile_image, :introduction, :name )
  end 
  
  def book_params
    params.require(:book).permit(:title, :body)
  end 
  
end
