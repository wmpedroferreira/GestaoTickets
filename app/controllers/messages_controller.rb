class MessagesController < ApplicationController

	def create
		@message = Message.create!(params[:message])	
		@message.author_id = current_user.id
		@message.read = false
		if @message.save
			redirect_to root_path, :flash => { :success => "Sent Message" } 
		end
	end
end