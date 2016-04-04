module ApplicationHelper
  def date_format(date)
    return date ? date.strftime("%B %d %Y") : ''
  end

  def has_bid(user, quote)
    return user.airline_quotes.include?(quote)
  end
end
