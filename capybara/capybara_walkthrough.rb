require "capybara"

# Register chrome driver with capybara
Capybara.register_driver :chrome do |app|
	Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

# Create a new session
session = Capybara::Session.new(:chrome)

# Use the visit method to navigate to page
session.visit('http://toolsqa.com/automation-practice-form/')

# Simple form method
session.fill_in('firstname', with: 'test1')
session.fill_in('lastname', with: 'test2')

# Radio buttons
session.choose('sex-0')
session.choose('exp-0')

# Date field
session.fill_in('datepicker', with: '01/01/2001')

# Profession button
session.check('profession-1')
session.check('tool-0')

# Drop down
session.select('Europe', from: 'continents')
session.select('Browser Commands', from: 'selenium_commands')

# Button
session.click_button('submit')

sleep 10