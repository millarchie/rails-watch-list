class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

    # we can't trigger this from a url, we need a delete link in show page
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, status: :see_other

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
