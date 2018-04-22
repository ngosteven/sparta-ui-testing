require 'spec_helper'

describe 'All functionality on the sign in page' do

	before(:all) do
		@bbc_site = BbcSite.new
		@bbc_homepage = @bbc_site.bbc_homepage
		@bbc_sign_in_page = @bbc_site.bbc_sign_in_page
	end
	
	context 'it should respond with the correct error when incorrect details are input signing in' do
		
		it 'Should produce an error when inputting an incorrect password to a invalid account' do
			@bbc_homepage.visit_home_page
			@bbc_homepage.click_sign_in_link
			@bbc_sign_in_page.fill_in_username('TestUser12')
			@bbc_sign_in_page.fill_in_password('TestPassword12')
			@bbc_sign_in_page.click_submit_button
			expect(@bbc_sign_in_page.invalid_user_message).to eq 'Sorry, we can’t find an account with that username. If you\'re over 13, try your email address instead or get help here.'
		end 
		
		it 'Should produce an error when inputting no details' do
			@bbc_homepage.visit_home_page
			@bbc_homepage.click_sign_in_link
			@bbc_sign_in_page.click_submit_button
			expect(@bbc_sign_in_page.invalid_user_password_message).to eq 'Sorry, those details don\'t match. Check you\'ve typed them correctly.'
			expect(@bbc_sign_in_page.invalid_user_message).to eq 'Something\'s missing. Please check and try again.'
			expect(@bbc_sign_in_page.invalid_password_message).to eq 'Something\'s missing. Please check and try again.'
		end 
		
		it 'Should produce an error when inputting a short username and password' do
			@bbc_homepage.visit_home_page
			@bbc_homepage.click_sign_in_link
			@bbc_sign_in_page.fill_in_username('U')
			@bbc_sign_in_page.fill_in_password('P')
			@bbc_sign_in_page.click_submit_button
			expect(@bbc_sign_in_page.invalid_user_message).to eq 'Sorry, that username\'s too short. It needs to be at least two characters.'
			expect(@bbc_sign_in_page.invalid_password_message).to eq 'Sorry, that password is too short. It needs to be eight characters or more.'
		end 
		
		it 'Should produce an error when inputting only letters in password field' do
			@bbc_homepage.visit_home_page
			@bbc_homepage.click_sign_in_link
			@bbc_sign_in_page.fill_in_username('TestUser12')
			@bbc_sign_in_page.fill_in_password('11111111')
			@bbc_sign_in_page.click_submit_button
			expect(@bbc_sign_in_page.invalid_password_message).to eq 'Sorry, that password isn\'t valid. Please include a letter.'
		end 
		
		it 'Should produce an error when inputting only numbers in password field' do
			@bbc_homepage.visit_home_page
			@bbc_homepage.click_sign_in_link
			@bbc_sign_in_page.fill_in_username('TestUser12')
			@bbc_sign_in_page.fill_in_password('aaaaaaaa')
			@bbc_sign_in_page.click_submit_button
			expect(@bbc_sign_in_page.invalid_password_message).to eq 'Sorry, that password isn\'t valid. Please include something that isn\'t a letter.'
		end 
	end

	context 'it should respond with correct messages when resetting account' do
		
		it 'Should produce an error message when no email is inputted for reset' do
			@bbc_homepage.visit_home_page
			@bbc_homepage.click_sign_in_link
			@bbc_sign_in_page.click_help_link
			@bbc_sign_in_page.click_forgotten_password
			@bbc_sign_in_page.click_submit_button
			expect(@bbc_sign_in_page.invalid_email_message).to eq 'Something\'s missing. Please check and try again.'
		end 
		
		it 'Should produce an error message when invalid email is inputted for reset' do
			@bbc_homepage.visit_home_page
			@bbc_homepage.click_sign_in_link
			@bbc_sign_in_page.click_help_link
			@bbc_sign_in_page.click_forgotten_password
			@bbc_sign_in_page.fill_in_username('U')
			@bbc_sign_in_page.click_submit_button
			expect(@bbc_sign_in_page.invalid_email_message).to eq 'Sorry, that doesn\'t look right. Please check it\'s a proper email.'
		end 
		
		it 'Should respond with the register page' do
			@bbc_homepage.visit_home_page
			@bbc_homepage.click_sign_in_link
			@bbc_sign_in_page.click_help_link
			@bbc_sign_in_page.click_forgotten_username
			@bbc_sign_in_page.click_register_link_help
		end 
		
		it 'Should produce with bbc tutorial page' do
			@bbc_homepage.visit_home_page
			@bbc_homepage.click_sign_in_link
			@bbc_sign_in_page.click_help_link
			@bbc_sign_in_page.click_none_of_above
		end 
	end

	context 'it should respond with the register page' do
		
		it 'Should produce the register page when link is clicked' do
			@bbc_homepage.visit_home_page
			@bbc_homepage.click_sign_in_link
			@bbc_sign_in_page.click_register_link
		end 
	end  
end
