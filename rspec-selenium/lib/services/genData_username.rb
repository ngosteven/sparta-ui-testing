require 'faker'

class GenDataUsernameService
	def randomusername
		fake_username = Faker::Internet.user_name
	end
end