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

  # AJM:  I'd sugest   
  def update
    clothing_item = ClothingItem.find(params[:id])
    tags_from_server = params[:tags].split(",")
    tags_from_db = clothing_item.tags.map{|tag| tag.text}
    deleted_tags = tags_from_db - tags_from_server
    deleted_tags = deleted_tags.map do |tag|
      t = Tag.find_by(text: tag)
      t.id
    end
    clothing_item.update(clothing_item_params)
    ClothingTagAssignment.where( tag_id: deleted_tags, clothing_item_id: clothing_item.id ).destroy_all
    ClothingTagAssignment.add_tags(params, clothing_item)

    redirect_to clothing_item_path(clothing_item)
  end

  def show
    @clothing_item = ClothingItem.find(params[:id])
    @tags = @clothing_item.tags
  end

  def destroy
    clothing_item = ClothingItem.find(params[:id])
    clothing_item.destroy
    ClothingTagAssignment.delete_tags(clothing_item)

    redirect_to clothing_items_path
  end

  private

  def clothing_item_params
    params.require(:clothing_item).permit(:image, :caption, :user_id)
  end

end
