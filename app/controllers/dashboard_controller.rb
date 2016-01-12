class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user.has_role? :broker
      redirect_to broker_board_url      
    else
    end
  end

  def broker_board
  end
end
