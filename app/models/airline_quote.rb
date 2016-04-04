class AirlineQuote < ActiveRecord::Base
# belongs_to :user

has_many :users, :through => :bids
has_many :bids

end
