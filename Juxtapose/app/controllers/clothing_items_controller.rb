class ClothingItemsController < ApplicationController

  def index
    @clothing_items = ClothingItem.all
  end

  def new
    @clothing_item = ClothingItem.new
  end

  def create
    @clothing_item = ClothingItem.create(clothing_item_params)
  end

  def edit
    @clothing_item = ClothingItem.find(params[:id])
  end

  def update
    clothing_item = ClothingItem.find(params[:id])
    clothing_item.update(clothing_item_params)
  end

  def show
    @clothing_item = ClothingItem.find(params[:id])
  end

  def destroy
    clothing_item = ClothingItem.find(params[:id])
    clothing_item.destroy
  end

  private

  def clothing_item_params
    params.require(:clothing_item).permit()
  end

end
