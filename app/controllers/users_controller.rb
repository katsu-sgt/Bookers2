class UsersController < ApplicationController
  
  def create
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    end  
  end
  
  def index
    @users = User.all
    @user = current_user
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end 
  
  def edit 
    @user = User.find(params[:id])
  end 
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render 'edit'
    end  
  end 
  
  
  private
  
  def user_params
    params.require(:user).permit(:profile_image, :introduction, :name)
  end 
  
  def book_params
    params.permit(:title, :body, :user_id)
  end 
  
end
