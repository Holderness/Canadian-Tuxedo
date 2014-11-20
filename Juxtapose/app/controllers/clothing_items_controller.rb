class ClothingItemsController < ApplicationController
  before_filter :authorize
  def index
    @clothing_items = current_user.clothing_items
  end

  def new
    @clothing_item = ClothingItem.new
    @tags = @clothing_item.tags
  end

  def create
    @clothing_item = ClothingItem.create(clothing_item_params)
    ClothingTagAssignment.add_tags(params, @clothing_item)
    redirect_to clothing_item_path(@clothing_item)

  end

  def edit
    @clothing_item = ClothingItem.find(params[:id])
    @tags = @clothing_item.tags
  end

  def update
    clothing_item = ClothingItem.find(params[:id])
    clothing_item.update(clothing_item_params)
    ClothingTagAssignment.delete(clothing_item)
    ClothingTagAssignment.add_tags(params, clothing_item)

    redirect_to clothing_item_path(clothing_item)
  end

  def show
    @clothing_item = ClothingItem.find(params[:id])
  end

  def destroy
    clothing_item = ClothingItem.find(params[:id])
    clothing_item.destroy
    ClothingTagAssignment.delete_tags(clothing_item)
  end

  private

  def clothing_item_params
    params.require(:clothing_item).permit(:image, :caption, :user_id)
  end

end
