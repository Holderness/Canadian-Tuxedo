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
    deleted_clothes_ids = params[:deleted_clothes]
    if deleted_clothes_ids
      deleted_clothes = deleted_clothes_ids.map do |clothing_id|
        ClothingItem.find(clothing_id)
      end
    end
    @clothing_items = current_user.clothing_items - @look_clothing_items

    @clothing_items += deleted_clothes if deleted_clothes


    respond_to do |format|
      format.html
      format.json {render :json => @clothing_items.to_json(:methods => [:clothing_image_url])}
    end

  end

  def update
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
    clothing_items_create_ids = params[:clothing_item_ids]
    clothing_items_delete_ids = params[:clothing_items_delete].split(",")
    clothing_items_create = clothing_items_create_ids || [] - clothing_items_delete_ids || []
    clothing_items_delete = clothing_items_delete_ids ||[] - clothing_items_create_ids || []
    clothing_items_create.each { |id| ClothingAssignment.create(clothing_item_id: id, look_id: look.id) } if clothing_items_create
    if clothing_items_delete
      clothing_items_delete.each do |item|
        ClothingAssignment.find_by(clothing_item_id: item, look_id: look.id).destroy
      end
    end
    redirect_to look_path(look)
  end

  def show
    @look = Look.find(params[:id])
    @clothing_items = @look.clothing_items
    @tags = @look.tags
    downvotes = Vote.where(look_id: @look.id, vote: -1).count
    upvotes = Vote.where(look_id: @look.id, vote: 1).count
    @total_votes = upvotes - downvotes
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