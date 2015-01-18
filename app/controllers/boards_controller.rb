class BoardsController < ApplicationController
	def index
		@boards = Board.all
	end

	def create
		@board = Board.new(board_params)
		if @board.save and @board.moderators.create( user_id: current_user.id )
			redirect_to @board
		else
			render 'new'
		end
	end

	def new
		@board = Board.new
	end

	def edit
		@board = Board.find(params[:id])
	end

	def show
		@board = Board.find(params[:id])
	end

	def update
		@board = Board.find(params[:id])
		if @board.update(board_params)
			redirect_to @board
		else
			render 'edit'
		end
	end

	def destroy
		@board = Board.find(params[:id])
		@board.destroy

		redirect_to boards_path
	end

	private
		def board_params
			params.require(:board).permit(:title, :description)
		end
end
