class BooksController < ApplicationController
before_action :authenticate_user!,exept: [:top]

  def create
    @books = Book.all
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      render 'books/index'
    end   
  end
  
  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end
  
  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end
  
  def edit
    @book = Book.find(params[:id])
    @user = @book.user
      if @user.id != current_user.id
        redirect_to books_path
      end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render 'edit'
    end  
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
  
  def user_params
    params.require(:user).permit(:profile_image, :introduction, :name)
  end 

end
