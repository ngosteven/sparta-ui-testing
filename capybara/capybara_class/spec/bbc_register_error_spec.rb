require 'spec_helper'

describe 'All functionality on the register page' do

	before(:all) do
		@bbc_site = BbcSite.new
		@bbc_homepage = @bbc_site.bbc_homepage
		@bbc_sign_in_page = @bbc_site.bbc_sign_in_page
		@bbc_register_page = @bbc_site.bbc_register_page
	end

	context 'it should respond with the correct error when incorrect details are input registering an account for over 13' do
		
		it 'Should produce an error when inputting nothing inside either/all dob fields' do
			@bbc_homepage.visit_home_page
			@bbc_homepage.click_sign_in_link
			@bbc_register_page.click_register_link
			@bbc_register_page.click_over_13_link
			@bbc_register_page.click_submit_button
			expect(@bbc_register_page.invalid_dob_message).to eq 'Oops, that date doesn\'t look right. Make sure it\'s a real date written as DD-MM-YYYY e.g. the 5th of June 2009 is 05-06-2009.'
		end

		it 'Should produce an error when inputting invalid values inside dob fields' do
			@bbc_homepage.visit_home_page
			@bbc_homepage.click_sign_in_link
			@bbc_register_page.click_register_link
			@bbc_register_page.click_over_13_link
			@bbc_register_page.fill_in_day('11')
			@bbc_register_page.fill_in_month('11')
			@bbc_register_page.fill_in_year('2011')
			@bbc_register_page.click_submit_button
			expect(@bbc_register_page.invalid_dob_message).to eq 'Sorry, you need to be 13 or over.'
		end
	end
	
end