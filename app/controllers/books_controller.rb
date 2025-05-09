class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path, notice: 'Book and recommendation added successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :image_url)
  end

end
