class BooksController < ApplicationController
  def new
  end

  def index
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end
  
  def show
    @book_show = Book.find(params[:id])
    @book = Book.new
  end

  def edit
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
end
