require "capybara/dsl"

class BbcRegisterPage

	include Capybara::DSL

	DAY_FIELD_ID = 'day-input'
	MONTH_FIELD_ID = 'month-input'
	YEAR_FIELD_ID = 'year-input'
	SUBMIT_BUTTON_ID = 'submit-button'
	DOB_FORM_MESSAGE_ID = 'form-message-dateOfBirth'


	def click_register_link
		click_link("Register now")
	end

	def click_over_13_link
		click_link("13 or over")
	end

	def click_under_13_link
		click_link("Under 13")
	end

	def click_submit_button
		click_button(SUBMIT_BUTTON_ID)
	end

	def fill_in_day(day)
		fill_in(DAY_FIELD_ID, with: day)
	end

	def fill_in_month(month)
		fill_in(MONTH_FIELD_ID, with: month)
	end

	def fill_in_year(year)
		fill_in(YEAR_FIELD_ID, with: year)
	end

	def invalid_dob_message
		find(:id, DOB_FORM_MESSAGE_ID).text
	end

end