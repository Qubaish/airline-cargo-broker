class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
    before_action :authenticate_user!
   # def after_sign_in_path_for(resource)
   # 	debugger
   # 	if current_user.has_role? :broker
   #    redirect_to broker_board_path     
   #  elsif current_user.has_role? :airplane
   #    redirect_to airplane_board_path
  	# else
  	#  redirect_to '/'
   #  end
   # end
end
