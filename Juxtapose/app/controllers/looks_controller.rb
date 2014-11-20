class LooksController < ApplicationController
  before_filter :authorize
  def index
    @looks = current_user.looks
  end

  def new
    @look = Look.new
    @clothing_items = current_user.clothing_items
  end

  def create
    look = Look.create(look_params)
    @clothing_item_ids = params[:clothing_item_ids]
    @clothing_item_ids.each do |clothing_item_id|
      ClothingAssignment.create(look_id: look.id, clothing_item_id: clothing_item_id)
    end

    redirect_to look_path(look)
  end

  def edit
    @look = Look.find(params[:id])
    @look_clothing_items = @look.clothing_items
    @clothing_items = current_user.clothing_items
  end

  def update
    look = Look.find(params[:id])
    look.update(look_params)
    redirect_to look_path(look)
  end

  def show
    @look = Look.find(params[:id])
    @clothing_items = @look.clothing_items
  end

  def destroy
    look = Look.find(params[:id])
    look.destroy
    redirect_to looks_path
  end

  private

  def look_params
    # This needs to be done
    params.require(:look).permit(:name, :user_id)
  end

  def clothing_assignment_params
    params.require(:clothing_assignment).permit(:look_id, :clothing_item_id)
  end

end