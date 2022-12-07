class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    if params[:list_id].present?
      @review.list = set_list
    else
      @review.movie = set_movie
    end
    @review.save
    if @review.list.present?
      redirect_to list_path(@review.list)
    else
      redirect_to movie_path(@review.movie)
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
end
