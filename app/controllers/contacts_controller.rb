class ContactsController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    if @message.valid?
     @to = "shoaib@gems.techverx.com,qubaish@gems.techverx.com,gr8mannan@gmail.com"
     UserMailer.new_message(@message, @to).deliver
      redirect_to(root_path, :notice => "Thank You! Your message successfully sent!")
    else
      flash.now.alert = "Please fill all fields."
      render :new
    end
  end

end