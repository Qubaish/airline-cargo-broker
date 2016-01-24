class BrokerQuote < ActiveRecord::Base
  belongs_to :user
  include PgSearch
  pg_search_scope :search, :against => [:name, :date_required], :using => {
                    :tsearch => {:prefix => true}
                  }
  pg_search_scope :search_by_origin_destination, :against => [:from_airpot, :to_airpot]

  NATURE_OF_CARGO = [['Dangerous Goods','Dangerous Goods'], ['Animals', 'Animals'], ['Urgent', 'Urgent'], ['Heavy/Outsized','Heavy/Outsized'], ['Humatarian Goods', 'Humatarian Goods']]
end
