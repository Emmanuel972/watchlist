class ListBookmarksController < ApplicationController
  before_action :set_list_bookmark, only: [:destroy]
  def new
    @list_bookmark = ListBookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @list_bookmark = ListBookmark.new(list_bookmark_params)
    @list_bookmark.list = List.find(params[:list_id])
    if @list_bookmark.save
      redirect_to list_path(@list_bookmark.list)
    else
      render :new
    end
  end

  def destroy
    @list_bookmark.destroy
    redirect_to list_path(@list_bookmark.list)
  end

  private

  def list_bookmark_params
    params.require(:list_bookmark).permit(:comment, :movie_id)
  end

  def set_list_bookmark
    @list_bookmark = ListBookmark.find(params[:id])
  end
end
