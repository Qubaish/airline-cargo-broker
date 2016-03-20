class DashboardController < ApplicationController
  before_action :authenticate_user!, :except => [:home, :demo]
  before_action :broker
  before_action :banner_nav, only: [:home]

  def index
    if current_user.has_role? :broker
      redirect_to broker_board_url      
    elsif current_user.has_role? :airplane
      redirect_to airplane_board_url
    end
  end

  def home
  end

  def broker_board
    if params[:search]
      check_search_type
    else
      @broker_data =  broker.broker_quotes
    end
  end

  def airplane_board
   @all_quotes = BrokerQuote.all
  end

  private

  def broker
    broker = current_user
  end

  def check_search_type
    type = params[:search]
    if type == "Origin Destination"
      if params[:post][:origin].present?
        @broker_data = BrokerQuote.search_by_origin_destination("#{params[:post][:origin]} #{params[:post][:destination]}")
      else
        @broker_data = BrokerQuote.all
      end
    elsif type = "Date"
       if params[:post][:q].present?
       date = params[:post][:q].to_date.strftime("%Y-%d-%m")
       @broker_data = BrokerQuote.search(date)
     else
        @broker_data = BrokerQuote.all
     end
    else
      if params[:post][:q].present?
        @broker_data = BrokerQuote.search(params[:post][:q])
      else
        @broker_data = BrokerQuote.all
      end
    end
  end

end
