module ApplicationHelper
  def date_format(date)
    return date ? date.strftime("%B %d %Y") : ''
  end
end
