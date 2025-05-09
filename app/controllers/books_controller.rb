class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @books = Book.all
    @trending_recommendations = Recommendation.all.sort_by do |recommendation|
      calculate_trending_score(recommendation)
    end.reverse
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

  def calculate_trending_score(recommendation)
    votes_score = recommendation.votes.count

    recency_weight = (Time.current - recommendation.created_at).to_i / (60 * 60 * 24 * 7) # Weeks ago
    recency_score = [0, 10 - recency_weight].max # Newer votes get more weight

    votes_score + recency_score
  end

end
