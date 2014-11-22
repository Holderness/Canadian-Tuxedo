class TagsController < ApplicationController

  def show_clothing
    tag_id = params[:id]
    @tag = Tag.find(tag_id)
    @clothing_items = @tag.clothing_items
  end

  def show_looks
    tag_id = params[:id]
    @tag = Tag.find(tag_id)
    @looks = @tag.looks
  end

end