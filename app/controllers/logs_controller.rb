class LogsController < ApplicationController

	def create
		@log = $current_ticket.logs.build(params[:log])	
		if @log.save
			redirect_to root_path
		end
	end

end