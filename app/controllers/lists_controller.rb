class ListsController < ApplicationController
  def index
    @lists = List.all
    @list = List.new # for the form
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks
  end

  def new
    # empty new instance to build the form:
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
      # @lists = List.all
      # render :index, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
