Given("I access the bbc login page") do
	puts "----------", @users
	bbc_homepage.visit_home_page
	bbc_homepage.click_sign_in_link
end

And("I input incorrect username details") do
	bbc_sign_in.fill_in_username('ewfsd@45544')
end

And("I input incorrect password details") do
	bbc_sign_in.fill_in_password('123a5678')
end

When("I try to login") do
	bbc_sign_in.click_sign_in_button
end

Then("I receive an error for not finding the account") do
	expect(bbc_sign_in.incorrect_password_text).to eq bbc_sign_in.incorrect_username_text
end

And("I input any username details") do
	bbc_sign_in.fill_in_username('testing@gmail.com')
end

And("I input a incorrect password as 1234abc") do
	bbc_sign_in.fill_in_password('1234abc')
end

Then("I receive an error stating it needs to be at least 8 chars") do
	expect(bbc_sign_in.check_password_message).to eq bbc_sign_in.password_too_short
end
