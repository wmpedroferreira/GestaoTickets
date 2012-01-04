class Log < ActiveRecord::Base
	belongs_to	:ticket
	attr_accessible(:ticket_id, :subject, :messagem)
end

# == Schema Information
#
# Table name: logs
#
#  id         :integer         not null, primary key
#  ticket_id  :string(255)
#  subject    :string(255)
#  messagem   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

