class UsersController < ApplicationController
  
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end
  
  def index
    @users = User.all
    @user = current_user
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end 
  
  def edit 
    @user = User.find(params[:id])
  end 
  
  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end 
  
  
  private
  
  def user_params
    params.require(:user).permit(:profile_image, :introduction, :name )
  end 
  
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end 
  
end
