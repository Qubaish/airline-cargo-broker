class UserMailer < ApplicationMailer
	default :from => 'admin@cargo.com'
	def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Thanks for signing up for our amazing app' )
  end
  def load_board_created(load)
  	broker_emails = User.with_role :broker
  	emails = broker_emails.collect(&:email).join(",")
  	@load = load
  	mail(:to => emails, :subject => "A load is created")

  end
end
