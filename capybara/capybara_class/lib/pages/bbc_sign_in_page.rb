require "capybara/dsl"

class BbcSignInPage

	include Capybara::DSL

	USER_FIELD_ID = 'user-identifier-input'
	PASSWORD_FIELD_ID = 'password-input'
	SUBMIT_BUTTON_ID = 'submit-button'
	USER_MESSAGE_ID = 'form-message-username'
	PASSWORD_MESSAGE_ID = 'form-message-password'
	GENERAL_MESSAGE_ID = 'form-message-general'
	EMAIL_MESSAGE_ID = 'form-message-email'

	def fill_in_username(username)
		fill_in(USER_FIELD_ID, with: username)
	end

	def fill_in_password(password)
		fill_in(PASSWORD_FIELD_ID, with: password)
	end

	def click_submit_button
		click_button(SUBMIT_BUTTON_ID)
	end

	def invalid_user_message
		find(:id, USER_MESSAGE_ID).text
	end

	def invalid_password_message
		find(:id, PASSWORD_MESSAGE_ID).text
	end

	def invalid_user_password_message
		find(:id, GENERAL_MESSAGE_ID).text
	end

	def click_register_link
		click_link("Register now")
	end

	def click_help_link
		click_link("Need help signing in?")
	end

	def click_forgotten_password
		click_link("I've forgotten my password")
	end

	def invalid_email_message
		find(:id, EMAIL_MESSAGE_ID).text
	end

	def click_forgotten_username
		click_link("I've forgotten my username or email")
	end

	def click_register_link_help
		click_link("Register for a new account")
	end

	def click_none_of_above
		click_link("None of the above")
	end

end