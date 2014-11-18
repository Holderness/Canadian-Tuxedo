class ClothingItemsController < ApplicationController
  def index
    @clothing_items = ClothingItem.all
  end
end
