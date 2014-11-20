class ClothingItemsController < ApplicationController

  def index
    @clothing_items = ClothingItem.all
  end

  def new
    @clothing_item = ClothingItem.new
  end

  def create
    @clothing_item = ClothingItem.create(clothing_item_params)
    redirect_to clothing_item_path(@clothing_item)
  end

  def edit
    @clothing_item = ClothingItem.find(params[:id])
  end

  def update
    clothing_item = ClothingItem.find(params[:id])
    clothing_item.update(clothing_item_params)
    redirect_to clothing_item_path(clothing_item)
  end

  def show
    @clothing_item = ClothingItem.find(params[:id])
  end

  def destroy
    clothing_item = ClothingItem.find(params[:id])
    clothing_item.destroy
    redirect_to clothing_items_path
  end

  private

  def clothing_item_params
    params.require(:clothing_item).permit(:image, :caption)
  end

end
