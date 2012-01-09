class Message < ActiveRecord::Base

	attr_accessible(:author_id, :deliver_id, :subject, :body, :read)
	


end
