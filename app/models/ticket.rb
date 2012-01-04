class Ticket < ActiveRecord::Base

	attr_accessible(:user_id, :project_id, :state_id,
					:urgency_id, :intervention_id, :request_type_id)
							
	default_scope	:order => 'tickets.created_at DESC'
	has_many	:logs, :dependent => :destroy

end

# == Schema Information
#
# Table name: tickets
#
#  id              :integer         not null, primary key
#  user_id         :string(255)
#  project_id      :string(255)
#  state_id        :string(255)
#  urgency_id      :string(255)
#  intervention_id :string(255)
#  request_type_id :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

