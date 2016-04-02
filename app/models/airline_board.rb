class AirlineBoard < ActiveRecord::Base
	after_save :send_emails_to_broker
	belongs_to :user
	def send_emails_to_broker
		UserMailer.load_board_created(self).deliver
	end
end
