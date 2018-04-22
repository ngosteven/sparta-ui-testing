require_relative 'pages/bbc_homepage'
require_relative 'pages/bbc_sign_in_page'
require_relative 'pages/bbc_register_page'

class BbcSite

	def bbc_homepage
		BbcHomePage.new
	end

	def bbc_sign_in_page
		BbcSignInPage.new
	end

	def bbc_register_page
		BbcRegisterPage.new
	end

end