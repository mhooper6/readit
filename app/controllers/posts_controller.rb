class PostsController < ApplicationController
	def create
		@board = Board.find(params[:board_id])
		@post = @board.posts.new(post_params)
		@post.user = current_user
		if @post.save
			redirect_to board_post_path(@board, @post)
		else
			render 'new'
		end
	end

	def new
		@board = Board.find(params[:board_id])
		@post = @board.posts.new
	end

	def show
		@board = Board.find(params[:board_id])
		@post = Post.find(params[:id])
	end

	def destroy
		@board = Board.find(params[:board_id])
		@post = @board.posts.find(params[:id])
		@post.destroy
		redirect_to @board
	end

	private
		def post_params
			params.require(:post).permit(:title, :link)
		end
end
