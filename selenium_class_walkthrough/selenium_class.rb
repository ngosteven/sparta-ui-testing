require 'selenium-webdriver'

class SeleniumQaToolsForm

	PRACTICE_FORM_URL = 'http://toolsqa.com/automation-practice-form/'
	FIRST_NAME_FIELD_NAME = 'firstname'
	LAST_NAME_FIELD_NAME = 'lastname'
	SEX_RADIO_NAME = 'sex'
	EXP_RADIO_NAME = 'exp'
	DATE_FIELD_NAME = 'datepicker'
	PROFESSION_RADIO_NAME = 'profession'
	TOOL_RADIO_NAME = 'tool'

	def initialize
		@chrome_driver = Selenium::WebDriver.for :chrome
	end

	def visit_practice_form
		@chrome_driver.get(PRACTICE_FORM_URL)
	end

	def input_firstname_field(text)
		@chrome_driver.find_element(:name, FIRST_NAME_FIELD_NAME).send_keys(text)
	end

	def get_first_name_text
		puts @chrome_driver.find_element(:name, FIRST_NAME_FIELD_NAME)['value']
	end

	def input_lastname_field(text)
		@chrome_driver.find_element(:name, LAST_NAME_FIELD_NAME).send_keys(text)
	end

	def get_last_name_text
		puts @chrome_driver.find_element(:name, LAST_NAME_FIELD_NAME)['value']
	end

	def input_sex_field
		@chrome_driver.find_element(:name, SEX_RADIO_NAME).click
	end

	def input_exp_field
		@chrome_driver.find_element(:name, EXP_RADIO_NAME).click
	end

	def input_date_field(text)
		@chrome_driver.find_element(:id, DATE_FIELD_NAME).send_keys(text)
	end

	def get_date_text
		puts @chrome_driver.find_element(:id, DATE_FIELD_NAME)['value']
	end

	def input_profession_field
		@chrome_driver.find_element(:name, PROFESSION_RADIO_NAME).click
	end

	def input_tool_field
		@chrome_driver.find_element(:name, TOOL_RADIO_NAME).click
	end
end

form = SeleniumQaToolsForm.new
form.visit_practice_form

form.input_firstname_field("Steven")
form.get_first_name_text

form.input_lastname_field("Ngo")
form.get_last_name_text

form.input_sex_field
form.input_exp_field

form.input_date_field("16/04/18")
form.get_date_text

form.input_profession_field

form.input_tool_field

sleep 7
