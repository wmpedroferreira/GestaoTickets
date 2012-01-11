class LogsController < ApplicationController
	before_filter :authenticate
	
	def create
		@log = $current_ticket.logs.build(params[:log])	
		if @log.close_ticket == "Yes"
			$current_ticket.update_attributes( :state_id => "Closed" )
		else
			$current_ticket.update_attributes( :state_id => "Open" )
		end
		if @log.save
			redirect_to $current_ticket , :flash => { :success => "Log inserted" }
		end
	end

end