class Airline < ActiveRecord::Base
	has_one :user
	accepts_nested_attributes_for :user
	#attr_accessible :user_attributes
	#validates :iata_code, presence: { message: "Story IATA code is required" }
	#accepts_nested_attributes_for :users

end
