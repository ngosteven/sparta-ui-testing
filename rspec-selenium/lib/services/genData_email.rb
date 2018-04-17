require 'faker'

class GenDataEmailService
	def randomemail
		fake_email = Faker::Internet.email
	end
end