class TagsController < ApplicationController


# AJM: Great! I'd want to see some of these behaviors moving out to the models they belong to and/or to module helpers.  For example, what do you think about writing a Flickr module.  Then here you could call something like.  Flickr.by_tags('blue') intead of seeing all the HTTParty here.    What do you thinK?
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
