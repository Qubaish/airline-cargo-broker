class UsersController < ApplicationController

  def create

  end
  def new
  	@user = User.new
  	1.times{ @user.airplanes.build }
  	
  end
  def create
  	debugger
  end
  def sign_up_as_airplan
    @user = User.new(:email=>params[:user][:email],:password=>params[:user][:password],:password_confirmation=>params[:user][:password_confirmation] )
    @user.save!
    @user.add_role(:airplane)
    @user.airplanes.create(:company_name=>params[:user][:airplanes][:company_name],:area_of_service=>params[:user][:airplanes][:area_of_service],:contact_name=>params[:user][:airplanes][:contact_name],:contact_address=>params[:user][:airplanes][:contact_address],:contact_phone=>params[:user][:airplanes][:contact_phone],:iata_code=>params[:user][:airplanes][:iata_code])
  # logout_keeping_session!
  current_user = @user
  redirect_to broker_board_url
end
end
