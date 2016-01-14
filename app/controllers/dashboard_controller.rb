class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :broker
  def index
    if current_user.has_role? :broker
      redirect_to broker_board_url      
    else
    end
  end

  def broker_board
   @broker_data =  broker.broker_quotes
  end

  private

  def broker
    broker = current_user
  end

end
