class AirlineQuote < ActiveRecord::Base
	belongs_to :user
	has_many :users, :through => :bids
	has_many :bids
	after_save :send_emails_to_broker
	def send_emails_to_broker
		UserMailer.load_board_created(self).deliver
	end

end
