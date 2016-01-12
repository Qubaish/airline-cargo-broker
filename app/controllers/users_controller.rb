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
end
