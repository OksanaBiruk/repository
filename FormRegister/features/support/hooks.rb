


Before  do
 @browser = Selenium::WebDriver.for :firefox
 @browser.get 'http://demo.redmine.org'
 #@browser.find_element(link => 'Register').click
end

After { @browser.close }