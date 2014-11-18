class LooksController < ApplicationController

  def index
    @looks = current_user.looks
  end

  def new
    @look = Look.new
  end

  def create
    look = Look.create(look_params)
  end

  def edit
    @look = Look.find(params[:id])
  end

  def update
    look = Look.find(params[:id])
    look.update(look_params)
  end

  def show
    @look = Look.find(params[:id])
  end

  def destroy
    look = Look.find(params[:id])
    look.destroy
  end

  private

  def look_params
    # This needs to be done
    params.require(:look).permit()
  end

end