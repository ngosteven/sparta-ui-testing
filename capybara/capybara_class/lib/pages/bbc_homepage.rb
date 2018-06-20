require "capybara/dsl"

class BbcHomePage

	include Capybara::DSL

	HOMEPAGE_URL = 'http://www.bbc.co.uk'
	SIGN_IN_LINK_ID = '#idcta-link'

	def visit_home_page
		visit(HOMEPAGE_URL)
	end

	def sign_in
		find(SIGN_IN_LINK_ID)
	end

	def click_sign_in_link
		find(SIGN_IN_LINK_ID).click
	end
end