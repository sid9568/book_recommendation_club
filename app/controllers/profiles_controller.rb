class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @recommendations = @user.recommendations.includes(:book).order(created_at: :desc)
    @votes_received_count = Recommendation.joins(:votes).where(user: current_user).distinct.count
  end
end
