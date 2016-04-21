class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :broker_inquiries

  def banner_nav
    @banner_nav = true
  end

  def broker_inquiries
    @broker_quotes_home = BrokerQuote.all.limit(5)
  end

  def airplane_inquiries
    @airplane_quotes_home = AirlineQuote.all.limit(5)
  end

end
