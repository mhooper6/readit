class CommentsController < ApplicationController
	def create
		@board = Board.find(params[:board_id])
		@post = @board.posts.find(params[:post_id])
		@comment = @post.comments.new(comment_params)
		@comment.user = current_user
		if @comment.save
			redirect_to board_post_path(@board, @post)
		end
	end

	def destroy
		@board = Board.find(params[:board_id])
		@post = @board.posts.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to board_post_path(@board, @post)
	end

	private
		def comment_params
			params.require(:comment).permit(:body)
		end
end