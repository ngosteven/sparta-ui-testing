require 'spec_helper'

describe 'testing the demoqa registration page' do 

	before(:all) do
		@driver = SeleniumDemoReg.new
		@driver.access_registration_form
		@wait = Selenium::WebDriver::Wait.new(timeout: 10)
		@fake_u = Gendataio.new.genData_username_service
		@fake_e = Gendataio.new.genData_email_service
		@fake_p = Gendataio.new.genData_password_service
		@fake_f = Gendataio.new.genData_firstname_service
		@fake_l = Gendataio.new.genData_lastname_service
		@username = @fake_u.randomusername
		@email = @fake_e.randomemail
		@password = @fake_p.randompassword
		@firstname = @fake_f.randomfirstname
		@lastname = @fake_l.randomlastname
	end

	context 'positive paths for the registration form and register' do

		it 'should land on the registration page' do
			expect(@driver.current_url).to eq 'http://demoqa.com/registration/'
		end

		it 'should accept a first name' do
			@driver.first_name_field_displayed
			@driver.set_first_name_field(@firstname)
			expect(@driver.get_first_name_field_value).to eq @firstname
		end

		it 'should accept a last name' do
			@driver.last_name_field_displayed
			@driver.set_last_name_field(@lastname)
			expect(@driver.get_last_name_field_value).to eq @lastname
		end

		it 'should accept a marital status selection of Single, Married, or Divorced' do
			@driver.select_marital_option('Single')
			@driver.select_marital_option('Married')
			@driver.select_marital_option('Divorced')
	    end

	    it 'should accept a hobby status selection of Dance, Reading, or Cricket' do
	      	@driver.select_hobby_option('Dance')
			@driver.select_hobby_option('Reading')
			@driver.select_hobby_option('Cricket')
	    end

	    it 'should have a country default of Afghanistan' do
	      	expect(@driver.get_selected_country).to eq 'Afghanistan'
	    end

	    it 'accept a new DOB' do
	      	@driver.dob_month_list_select('8')
	      	@driver.dob_day_list_select('27')
	      	@driver.dob_year_list_select('1994')
	    end

	    it 'should accept a new country value' do
	      	@driver.country_dropdown_list_select('United Kingdom')
	    end

	    it 'should accept a valid phone number' do
	      	@driver.set_phone_number_field('01234567890')
			expect(@driver.get_phone_number_field_value.length).to eq 11
			expect(@driver.get_phone_number_field_value).to eq '01234567890'
	    end

	    it 'should accept a username' do
	      	@driver.set_user_name_field(@username)
			expect(@driver.get_user_name_field_value).to eq @username
	    end

	    it 'should accept a email' do
	      	@driver.set_email_field(@email)
			expect(@driver.get_email_field_value).to eq @email
	    end

	    it 'should accept a about yourself text' do
	      	@driver.set_about_yourself_field('I am a Spartan')
			expect(@driver.get_about_yourself_value).to eq 'I am a Spartan'
	    end

	    it 'should accept a password' do
	      	@driver.set_password_field(@password)
			expect(@driver.get_password_value).to eq @password
	    end

	    it 'should accept a password confirmation' do
	      	@driver.set_confirmation_password_field(@password)
			expect(@driver.get_confirmation_password_value).to eq @password
			expect(@driver.get_confirmation_password_value).to eq @driver.get_password_value
		end

	    it 'should register successfully' do
	      	@driver.click_submit
	      	@driver.check_registration_successful
	    end
	end
end
