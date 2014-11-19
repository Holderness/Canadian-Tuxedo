class LooksController < ApplicationController

  def index
    @looks = Look.all
  end

  def new
    @look = Look.new
  end

  def create
    look = Look.create(look_params)
    redirect_to look_path(look)
  end

  def edit
    @look = Look.find(params[:id])
  end

  def update
    look = Look.find(params[:id])
    look.update(look_params)
    redirect_to look_path(look)
  end

  def show
    @look = Look.find(params[:id])
  end

  def destroy
    look = Look.find(params[:id])
    look.destroy
    redirect_to looks_path
  end

  private

  def look_params
    # This needs to be done
    params.require(:look).permit(:name)
  end

end