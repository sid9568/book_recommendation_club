class RecommendationsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @book = Book.find(params[:book_id])
    @recommendation = @book.recommendations.new
  end

  def create
    @book = Book.find(params[:book_id])
    @recommendation = @book.recommendations.new(recommendation_params.merge(user: current_user))

    if @recommendation.save
      redirect_to book_path(@book), notice: 'Recommendation added successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def recommendation_params
    params.require(:recommendation).permit(:review)
  end
end
