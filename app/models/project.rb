class Project < ActiveRecord::Base	
	
	attr_accessible(:title, :client_id, :admin_id, :description)
	has_many	:tickets,	:dependent => :destroy
	
end


# == Schema Information
#
# Table name: projects
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  client_id   :string(255)
#  admin_id    :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

