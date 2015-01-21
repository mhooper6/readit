class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy, :subscribe, :unsubscribe]

  # GET /boards
  # GET /boards.json
  def index
    @boards = Board.all
  end

  # GET /boards/1
  # GET /boards/1.json
  def show
  end

  # GET /boards/new
  def new
    @board = Board.new
  end

  # GET /boards/1/edit
  def edit
  end

  # POST /boards
  # POST /boards.json
  def create
    @board = Board.new(board_params)
    @board.moderators.build(user: current_user)

    respond_to do |format|
      if @board.save
        format.html { redirect_to @board, notice: 'Board was successfully created.' }
        format.json { render :show, status: :created, location: @board }
      else
        format.html { render :new }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boards/1
  # PATCH/PUT /boards/1.json
  def update
    respond_to do |format|
      if @board.update(board_params)
        format.html { redirect_to @board, notice: 'Board was successfully updated.' }
        format.json { render :show, status: :ok, location: @board }
      else
        format.html { render :edit }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boards/1
  # DELETE /boards/1.json
  def destroy
    @board.destroy
    respond_to do |format|
      format.html { redirect_to boards_url, notice: 'Board was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # PUT /boards/1/subscribe
  # add current user to board subscribers
  def subscribe
    unless current_user
      format.html { redirect_to @board, notice: 'Must be logged in to subscribe to boards.' }
    end
    @board.subscribers.build(user: current_user)
    respond_to do |format|
      if @board.save
        format.html { redirect_to @board, notice: 'Subscribed!' }
      else
        format.html { render @board, notice: 'Unable to subscribe.' }
      end
    end
  end

  # DELETE /boards/1/subscribe
  # remove current user from board subscribers
  def unsubscribe
    unless current_user
      format.html { redirect_to @board, notice: 'Must be logged in to unsubscribe from boards.' }
    end
    @subscriber = @board.subscribers.find_by user_id: current_user.id
    Subscriber.destroy(@subscriber)

    respond_to do |format|
      if @board.save
        format.html { redirect_to @board, notice: 'Unsubscribed.' }
      else
        format.html { render @board, notice: 'Unable to unsubscribe.' }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = Board.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def board_params
      params.require(:board).permit(:title, :description)
    end
end
