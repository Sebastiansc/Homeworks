class BooksController < ApplicationController
  def index
    @books = Book.all
    # your code here
  end

  def new
    # your code here
  end

  def create
    # your code here
    book = Book.new(book_params)

    if book.save
      redirect_to action: "index"
    else
      render json: book.errors.full_message, status: :unprocessable_entity
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy!
    redirect_to action: "index"
    else
      render json: book.errors.full_message, status: :unprocessable_entity
    end
    # your code here
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
