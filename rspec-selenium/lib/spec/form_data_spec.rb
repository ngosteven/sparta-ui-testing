require 'spec_helper'

describe 'testing the random form data services' do 

	before(:all) do
		@form_data_firstname = Gendataio.new.genData_firstname_service
		@form_data_lastname = Gendataio.new.genData_lastname_service
		@form_data_username = Gendataio.new.genData_username_service
		@form_data_password = Gendataio.new.genData_password_service
		@form_data_email = Gendataio.new.genData_email_service
	end

	it 'should return a random first_name which is a string' do
		expect(@form_data_firstname.randomfirstname).to be_a String
	end

	it 'should return a random last_name which is a string' do
		expect(@form_data_lastname.randomlastname).to be_a String
	end

	it 'should return a random user_name which is a string' do
		expect(@form_data_username.randomusername).to be_a String
	end

	it 'should return a random password which is a string' do
		expect(@form_data_password.randompassword).to be_a String
	end

	it 'should return a random email which is a string' do
		expect(@form_data_email.randomemail).to be_a String
	end

end