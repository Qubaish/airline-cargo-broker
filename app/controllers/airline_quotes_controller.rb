class AirlineQuotesController < ApplicationController
  before_filter :airline_quote, only: [:show]

  def new
    @quote = AirlineQuote.new
  end

  def create
    @quote = AirlineQuote.new(airline_quote_params)
    @quote.user = current_user
    if @quote.save
      redirect_to "/airplane_board"
    else
      render :text => "abc"
    end
  end

  def show
  end

  def user_bid
    user = User.find(params["user"].to_i)
    user.airline_quotes << AirlineQuote.find(params["quote"].to_i)
    render :json => { :success => "success"}
  end

  def bidded_quotes
    @bids = current_user.bids
  end

  private

  def airline_quote
    @airline_quote = AirlineQuote.find(params[:id])
  end

  def airline_quote_params
    date = params["day"] + "-" + params["month"] + "-" + params["year"]
    params[:airline_quote][:date_required] = Date.parse(date)
    params.require(:airline_quote).permit(:from_airpot, :to_airpot, :date_required, :weight, :volume, :cargo_dimension_width, :cargo_dimension_height, :cargo_dimension_length, :quantiy, :user_id, :additional_information, :special_requirements)
  end

end
