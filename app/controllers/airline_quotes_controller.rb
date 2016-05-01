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
      redirect_to root_path, notice: 'Something went wrong'
    end
  end

  def show
    @existing_quotes = current_user.broker_quotes
    @broker_quote = BrokerQuote.new
  end

  def user_bid
    if params[:broker_quote]
      airline_quote_id = params[:broker_quote].delete :quote_id
      broker_quote = BrokerQuote.new(broker_quote_params)
      broker_quote.save
      broker_quote.user = current_user
      quote = AirlineQuote.find(airline_quote_id.to_i)
      current_user.bids.create(airline_quote: quote, broker_quote_id: broker_quote.id)
    else
      quote = AirlineQuote.find(params["airline_quote_id"].to_i)
      current_user.bids.create(airline_quote: quote, broker_quote_id: params[:broker_quote_id])
    end
    redirect_to :back
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

  def broker_quote_params
    date = params["day"] + "-" + params["month"] + "-" + params["year"]
    params[:broker_quote][:date_required] = Date.parse(date)
    params.require(:broker_quote).permit(:from_airpot, :to_airpot, :date_required, :nature_of_cargo, :un_number, :payload, :volume, :cargo_dimension_width, :cargo_dimension_height, :cargo_dimension_length, :quantiy, :user_id, :name, :company_name, :email, :uan_number, :hear, :additional_information, :special_requirements)
  end

end
