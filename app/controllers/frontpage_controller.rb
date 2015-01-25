class FrontpageController < ApplicationController
  def index
  	if current_user	
  		@posts = Post.joins(:board)
  			.joins("INNER JOIN subscribers ON boards.id = subscribers.board_id")
  			.where(subscribers: {user_id: current_user.id})
  			.order(:score).limit(25)
  	else
  		@posts = Post.order(:score).limit(25)
  	end
  end
end
