class VotesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :set_recommendation

  def create
    @vote = @recommendation.votes.find_or_initialize_by(user: current_user)
    if @vote.save
      redirect_to book_path(@recommendation.book), notice: 'Voted!'
    else
      redirect_to book_path(@recommendation.book), alert: 'Could not vote.'
    end
  end

  def destroy
    @vote = @recommendation.votes.find_by(user: current_user)
    if @vote&.destroy
      redirect_to book_path(@recommendation.book), notice: 'Vote removed.'
    else
      redirect_to book_path(@recommendation.book), alert: 'Could not remove vote.'
    end
  end

  private

  def set_recommendation
    @recommendation = Recommendation.find(params[:recommendation_id])
  end
end
