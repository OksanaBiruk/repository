require 'selenium-webdriver'
require 'rspec'

browser = Selenium::WebDriver.for :firefox

Given (/^I am on the Front Page$/) do
  browser.get 'http://demo.redmine.org'
end

When(/^I click on "([^"]*)" link$/) do |link_text|
  browser.find_element(link_text:link_text).click
end

And(/^I fill up "([^"]*)" text field with (.*)$/) do |text_field_id, value|
  browser.find_element(id:text_field_id).clear
  browser.find_element(id:text_field_id).send_keys value
end

And(/^I click on "([^"]*)" button$/) do |button_name|
  browser.find_element(name:button_name).click
end

Then(/^Warning (.*) is appeared$/) do |message|
  browser.manage.timeouts.implicit_wait = 10
  expect(browser.find_element(id:'errorExplanation').text).to include message
end