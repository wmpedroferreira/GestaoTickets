require 'spec_helper'

describe Ticket do
  pending "add some examples to (or delete) #{__FILE__}"
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

