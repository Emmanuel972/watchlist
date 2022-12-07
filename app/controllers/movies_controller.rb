class MoviesController < ApplicationController
  before_action :set_reviews, only: [:show]
  def show
    @movie = Movie.find(params[:id])
    @review = Review.new
  end

  private

  def set_reviews
    @reviews = Review.where(movie_id: params[:id])
  end
end
