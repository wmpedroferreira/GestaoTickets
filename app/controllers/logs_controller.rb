class LogsController < ApplicationController
	before_filter :authenticate
	
	def create
		@log = $current_ticket.logs.build(params[:log])	
		if @log.close_ticket == "Yes"
			$current_ticket.update_attributes( :state_id => "Closed" )
		end
		if @log.save
			redirect_to root_path
		end
	end

end