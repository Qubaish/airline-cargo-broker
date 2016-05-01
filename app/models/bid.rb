class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :airline_quote
  belongs_to :broker_quote
end
