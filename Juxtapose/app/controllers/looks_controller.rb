class LooksController < ApplicationController
  before_filter :authorize
  def index
    @looks = current_user.looks
  end

  def new
    @look = Look.new
    @clothing_items = current_user.clothing_items
    @tags = @look.tags
  end

  def create
    look = Look.create(look_params)
    @tags = look.tags
    @clothing_item_ids = params[:clothing_item_ids]
    @clothing_item_ids.each do |clothing_item_id|
      ClothingAssignment.create(look_id: look.id, clothing_item_id: clothing_item_id)
    end
    LookTagAssignment.add_tags(params, look)
    redirect_to look_path(look)
  end

  def edit
    @look = Look.find(params[:id])
    @tags = @look.tags
    @look_clothing_items = @look.clothing_items
    @clothing_items = current_user.clothing_items
  end

  def update
    binding.pry
    look = Look.find(params[:id])
    # update tags
    tags_from_server = params[:tags].split(",")
    tags_from_db = look.tags.map{|tag| tag.text}
    deleted_tags = tags_from_db - tags_from_server
    deleted_tags = deleted_tags.map do |tag|
      t = Tag.find_by(text: tag)
      t.id
    end
    look.update(look_params)
    LookTagAssignment.where( tag_id: deleted_tags, look_id: look.id ).destroy_all
    LookTagAssignment.add_tags(params, look)
    # update clothing items
    clothing_item_ids = params[:clothing_item_ids]
    clothing_item_ids.each { |id| ClothingAssignment.create(clothing_item_id: id, look_id: look.id) } if clothing_item_ids
    clothing_items_delete = params[:clothing_items_delete].split(",")
    clothing_items_delete.each do |item|
      ClothingAssignment.find_by(clothing_item_id: item, look_id: look.id).destroy
    end
    redirect_to look_path(look)
  end

  def show
    @look = Look.find(params[:id])
    @clothing_items = @look.clothing_items
    @tags = @look.tags
  end

  def destroy
    look = Look.find(params[:id])
    look.destroy
    LookTagAssignment.delete_tags(look)
    redirect_to looks_path
  end

  def gallery
    @looks = Look.all
  end

  private

  def look_params
    # This needs to be done
    params.require(:look).permit(:name, :user_id, :image)
  end

  def clothing_assignment_params
    params.require(:clothing_assignment).permit(:look_id, :clothing_item_id)
  end

end