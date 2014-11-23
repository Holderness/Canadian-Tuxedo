class TagsController < ApplicationController



  def show_clothing
    tag_id = params[:id]
    @tag = Tag.find(tag_id)
    @clothing_items = @tag.clothing_items
    clothing_inspiration = HTTParty.get("https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=#{ENV['flickr_code']}&tags=#{URI.escape(@tag.text)},clothes,lookbook&sort=relevance&safe_search=1&per_page=20&tag_mode=all")
    respond_to do |format|
      format.html
      format.json {render :json =>clothing_inspiration.to_json}
    end
  end

  def show_looks
    tag_id = params[:id]
    @tag = Tag.find(tag_id)
    @looks = @tag.looks
    looks_inspiration = HTTParty.get("https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=#{ENV['flickr_code']}&tags=#{URI.escape(@tag.text)},clothes,lookbook&sort=relevance&safe_search=1&per_page=20&tag_mode=all")
    respond_to do |format|
      format.html
      format.json {render :json =>looks_inspiration.to_json}
    end
  end

end