class AirlinesController < ApplicationController
  before_action :set_airline, only: [:show, :edit, :update, :destroy]

  # GET /airlines
  # GET /airlines.json
  def index
    @airlines = Airline.all
  end

  # GET /airlines/1
  # GET /airlines/1.json
  def show
  end

  # GET /airlines/new
  def new
    @airline = Airline.new
    # @airline.build_user
    #1.times{ @airline.users.build }
  end

  # GET /airlines/1/edit
  def edit
  end

  # POST /airlines
  # POST /airlines.json
  def create
    debugger
    @airline = Airline.new(airline_params)
    
    respond_to do |format|
      if @airline.save
        @user = User.create(:email=>params[:airline][:users][:email],:password=>params[:airline][:users][:password],:password_confirmation=>params[:airline][:users][:password_confirmation],:airline_id=>@airline.id)
        @user.add_role(:airplane)
        format.html { redirect_to root_path, notice: 'Please Check you email for confirmation' }
        format.json { render :show, status: :created, location: @airline }
      else
        format.html { render :new }
        format.json { render json: @airline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /airlines/1
  # PATCH/PUT /airlines/1.json
  def update
    debugger
    return
    respond_to do |format|
      if @airline.update(airline_params)
        format.html { redirect_to @airline, notice: 'Airline was successfully updated.' }
        format.json { render :show, status: :ok, location: @airline }
      else
        format.html { render :edit }
        format.json { render json: @airline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /airlines/1
  # DELETE /airlines/1.json
  def destroy
    @airline.destroy
    respond_to do |format|
      format.html { redirect_to airlines_url, notice: 'Airline was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_airline
      @airline = Airline.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def airline_params
      params.require(:airline).permit( :airline_name,  user_attributes: [:email] )
      params.require(:airline).permit(:airline_name,:airline_address,:country,:contact_person_name,:contact_person_address,:contact_person_email,:contact_number,:iata_code,:caa_license,:user_id,:year_in_service, :user_attributes=> [:email,:password,:password_confirmation])
    end
end
