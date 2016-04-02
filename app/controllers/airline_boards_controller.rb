class AirlineBoardsController < ApplicationController
  before_action :set_airline_board, only: [:show, :edit, :update, :destroy]

  # GET /airline_boards
  # GET /airline_boards.json
  def index
    @airline_boards = current_user.airline_boards.all
  end

  # GET /airline_boards/1
  # GET /airline_boards/1.json
  def show
  end

  # GET /airline_boards/new
  def new
    @airline_board = AirlineBoard.new
  end

  # GET /airline_boards/1/edit
  def edit
  end

  # POST /airline_boards
  # POST /airline_boards.json
  def create
    @airline_board = AirlineBoard.new(airline_board_params)
    @airline_board.user = cureent_user
    respond_to do |format|
      if @airline_board.save
        format.html { redirect_to @airline_board, notice: 'Airline board was successfully created.' }
        format.json { render :show, status: :created, location: @airline_board }
      else
        format.html { render :new }
        format.json { render json: @airline_board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /airline_boards/1
  # PATCH/PUT /airline_boards/1.json
  def update
    respond_to do |format|
      if @airline_board.update(airline_board_params)
        format.html { redirect_to @airline_board, notice: 'Airline board was successfully updated.' }
        format.json { render :show, status: :ok, location: @airline_board }
      else
        format.html { render :edit }
        format.json { render json: @airline_board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /airline_boards/1
  # DELETE /airline_boards/1.json
  def destroy
    @airline_board.destroy
    respond_to do |format|
      format.html { redirect_to airline_boards_url, notice: 'Airline board was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_airline_board
      @airline_board = AirlineBoard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def airline_board_params
      params[:airline_board].permit(:from_airpot,:to_airpot,:date_available,:nature_of_cargo,:volume,:cargo_dimension_width,:cargo_dimension_height,:cargo_dimension_length,:quantiy,:additional_information,:special_requirements)
    end
end
