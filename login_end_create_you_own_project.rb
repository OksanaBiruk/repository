require 'selenium-webdriver'
browser = Selenium::WebDriver.for :firefox
browser.get 'http://demo.redmine.org'
@login = 'Test007'
@password = 'qwerty'
@project_name ='my test project'
@description = 'blablabla'
@project_identifier = 'project13' # меняем при каждом запуске
@name = 'name name'

def log_in(browser)
	browser.find_element(:link => 'Sign in').click
	browser.find_element(:id => 'username').send_keys @login
	browser.find_element(:id => 'password').send_keys @password
	browser.find_element(:name => 'login').click
end

def new_own_project(browser)

	browser.find_element(:link => 'create your own project').click
	browser.find_element(:id => 'project_name').send_keys @project_name
	browser.find_element(:id =>'project_description').send_keys @description
	browser.find_element(:id =>'project_identifier').clear
	browser.find_element(:id =>'project_identifier').send_keys @project_identifier
	browser.find_element(:name => 'commit').click

	if browser.find_element(:id => 'project_is_public').selected? == false
		check ('project_is_public')
		browser.find_element(:name => 'commit').click
	else
		browser.find_element(:name => 'commit').click
	end

	browser.find_element(:id => 'tab-modules').click
	browser.find_element(:link => 'Check all').click
	# browser.find_element(:name => 'commit').click   чего-то не работает пока)
	browser.find_element(:id => 'tab-versions').click
	browser.find_element(:link => 'New version').click
	browser.find_element(:name => 'version[name]' ).send_keys @name
	browser.find_element(:id => 'version_description' ).send_keys @description
	browser.find_element(:name => 'commit').click

	browser.find_element(:id => 'tab-categories').click
	browser.find_element(:link => 'New category').click
	browser.find_element(:id => 'issue_category_name' ).send_keys @name
	browser.find_element(:name => 'commit').click
	browser.find_element(:id => 'tab-boards').click
	browser.find_element(:link => 'New forum').click
	browser.find_element(:id => 'board_name' ).send_keys @name
	browser.find_element(:id => 'board_description' ).send_keys @description
	browser.find_element(:name => 'commit').click
	
if browser.find_element(:id => 'flash_notice').text != 'Successful creation.'
	puts 'Couldn\'t find success message'
end

end

log_in(browser)
new_own_project(browser)
browser.close