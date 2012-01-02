class Client < ActiveRecord::Base
  
  attr_accessible(:name, :short_name)
end
# == Schema Information
#
# Table name: clients
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  short_name :string(255)
#  created_at :datetime
#  updated_at :datetime
#

