require_relative 'services/genData_username'
require_relative 'services/genData_email'
require_relative 'services/genData_password'
require_relative 'services/genData_firstname'
require_relative 'services/genData_lastname'

class Gendataio
	def genData_username_service
		GenDataUsernameService.new
	end

	def genData_email_service
		GenDataEmailService.new
	end

	def genData_password_service
		GenDataPasswordService.new
	end

	def genData_firstname_service
		GenDataFirstnameService.new
	end

	def genData_lastname_service
		GenDataLastnameService.new
	end
end