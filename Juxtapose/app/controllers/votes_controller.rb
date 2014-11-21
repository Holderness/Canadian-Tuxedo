class Votes < ApplicationController

	 def gallery_vote
    vote = params[:vote]
    look_id = params[:look_id]
    Vote.create(vote: vote look_id: look_id)

    respond_to do |format|
      format.json {render :nothing => true}
    end
  end

  
end