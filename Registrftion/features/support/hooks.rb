
Before  do
  @browser = Selenium::WebDriver.for :firefox
  @browser.get 'http://demo.redmine.org'
end

After { @browser.close }