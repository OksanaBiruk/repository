require 'selenium-webdriver'

browser = Selenium::WebDriver.for :firefox
browser.get 'http://demo.redmine.org'
@login = 'test_login136' #змінюємо при кожному запуску
@email = @login + '@mail.test'
@first_name = 'first name'
@last_name = 'last name'
@message = 'Your account has been activated. You can now log in.'
	def register(browser)
		
		browser.find_element(:link => 'Register').click
		browser.find_element(:id => 'user_login').send_keys @login
		browser.find_element(:id => 'user_password').send_keys 'qwerty'
		browser.find_element(:id => 'user_password_confirmation').send_keys 'qwerty'
		browser.find_element(:id => 'user_firstname').send_keys @first_name
		browser.find_element(:id => 'user_lastname').send_keys @last_name
		browser.find_element(:id => 'user_mail').send_keys(@email)
		browser.find_element(:name => 'commit').click
	end

register(browser)
	def logged_in? browser
		browser.find_element(:css => '#loggedas .user').text
	end

	def message_is? browser
		browser.find_element(:id => 'flash_notice').text
	end

	# def get_first_name browser
	# 	browser.find_element(:id => 'user_firstname').text
	# end

	# def get_last_name(browser)
	# 	browser.find_element(:id => 'user_lastname').text
	# end

sleep 2

# fail 'Last name is not "last name"' if get_last_name(browser) != @last_name
fail 'Couldn\'t find success message' unless message_is?(browser) == @message
fail 'We are not logged in' unless logged_in?(browser) == @login

# if get_first_name(browser) != @first_name
# 	fail "First name is not 'first_name'"
# end

# fail "Email is not #{email}" unless browser.find_element(:id => 'user_mail').text == @email


browser.find_element(:id => 'user_firstname').send_keys('new' + @first_name)
browser.find_element(:name => 'commit').click

fail 'Couldn\'t find success message' unless browser.find_element(:id => 'flash_notice').text == 'Account was successfully updated.'

browser.find_element(:link => 'Delete my account').click

	if browser.find_element(:id =>'confirm').selected? == false
		click('confirm')
		browser.find_element(:name => 'commit').click
	else
		browser.find_element(:name => 'commit').click
	end

