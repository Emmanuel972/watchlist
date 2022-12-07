class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]
  before_action :set_list_bookmark, only: [:show]
  before_action :set_reviews, only: [:show]
  def home
    # select the 3 most recent lists
    @lists = List.last(3)
  end

  def index
    @lists = List.all
  end

  def show
    @review = Review.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name, :picture)
  end

  def set_list
    @list = List.find(params[:id])
  end

  def set_list_bookmark
    @list_bookmarks = ListBookmark.where(list_id: params[:id])
  end

  def set_reviews
    @reviews = Review.where(list_id: params[:id])
  end
end
