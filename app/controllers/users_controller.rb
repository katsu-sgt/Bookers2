class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    
    @book = Book.new
  
  end 
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path
    
  end 
  
  def index
    @users = User.all
  end
  
  
  
  
  
  private
  
  def user_params
    params.require(:user).permit(:profile_image, :introduction, :name )
  end 
  
  def book_params
    params.reauire(:book).permit(:title, :body)
  end 
  
end
