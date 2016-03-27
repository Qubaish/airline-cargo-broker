class BrokerQuotesController < ApplicationController

  def new
    @quote = BrokerQuote.new
  end

  def create
    @quote = BrokerQuote.new(broker_quote_params)
    @quote.user = current_user
    if @quote.save
      redirect_to "/broker_board"
    else
      render :text => "abc"
    end
  end

  def show
    @broker = BrokerQuote.find(params[:id])
  end

  def search_by_broker
    if params[:post][:q].present?
      @broker_data = BrokerQuote.search_by_title(params[:post][:q])
    else
      @broker_data = BrokerQuote.all
    end
    render "dashboard/broker_board"
  end

  private

  def broker_quote_params
    date = params["day"] + "-" + params["month"] + "-" + params["year"]
    params[:broker_quote][:date_required] = Date.parse(date)
    params.require(:broker_quote).permit(:from_airpot, :to_airpot, :date_required, :nature_of_cargo, :un_number, :payload, :volume, :cargo_dimension_width, :cargo_dimension_height, :cargo_dimension_length, :quantiy, :user_id, :name, :company_name, :email, :uan_number, :hear, :additional_information, :special_requirements)
  end

end
