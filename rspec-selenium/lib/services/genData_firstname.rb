require 'faker'

class GenDataFirstnameService
	def randomfirstname
		fake_firstname = Faker::Name.first_name
	end
end