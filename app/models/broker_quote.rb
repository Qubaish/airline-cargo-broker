class BrokerQuote < ActiveRecord::Base
  belongs_to :user
  NATURE_OF_CARGO = [['Dangerous Goods','Dangerous Goods'], ['Animals', 'Animals'], ['Urgent', 'Urgent'], ['Heavy/Outsized','Heavy/Outsized'], ['Humatarian Goods', 'Humatarian Goods']]
end
