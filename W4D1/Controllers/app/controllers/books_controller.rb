class BooksController < ApplicationController
  def index
    @books = Book.all
    # your code here
    render :index
  end

  def new
    render :new
    # your code here
  end

  def create
    book = Book.new(book_params)
    if book.save
      redirect_to books_url
    else
      flash.now[:errors] = book.errors.full_messages
      render :new
    end
    # your code here
  end

  def destroy
    # your code here
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_url
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
