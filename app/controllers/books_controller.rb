class BooksController < ApplicationController
  
  def new
    @book = Book.new
  end 
  
  def create
  end 
  
  def index
    @books = Book.all
  end 
  
  def show
    @book = Book.find(params[:id])
  end
  
  def destroy
  end 
  
  def edit
  end 
  
end
