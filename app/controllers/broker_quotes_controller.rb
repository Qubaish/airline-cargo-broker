class BrokerQuotesController < ApplicationController

  def new
    @quote = BrokerQuote.new
  end

  def create
    @quote = BrokerQuote.new(broker_quote_params)
    @quote.user = current_user
    if @quote.save
      redirect_to root_url
    else
      render :text => "abc"
    end
  end

  private

  def broker_quote_params
    params.require(:broker_quote).permit(:from_airpot, :to_airpot, :date_required, :nature_of_cargo, :un_number, :payload, :volume, :cargo_dimension_width, :cargo_dimension_height, :cargo_dimension_length, :quantiy, :user_id, :name, :company_name, :email, :uan_number, :hear, :additional_information, :special_requirements)
  end

end
