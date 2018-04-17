require 'faker'

class GenDataPasswordService
	def randompassword
		fake_password = Faker::Internet.password(8)
	end
end