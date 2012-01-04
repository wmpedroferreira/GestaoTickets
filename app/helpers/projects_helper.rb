module ProjectsHelper
	def current_project
		if !current_project.nil?
			@current_project
		end
	end

	def current_project=(project)
		@current_project = project
	end

end
