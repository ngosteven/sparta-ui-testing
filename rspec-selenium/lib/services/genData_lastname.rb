require 'faker'

class GenDataLastnameService
	def randomlastname
		fake_lastname = Faker::Name.last_name
	end
end