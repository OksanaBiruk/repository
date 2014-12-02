

Given(/^I click on Register link$/) do
  on(HomePage).go_register_page
end

And(/^I fill up text fields with (.*)$/) do |login|
  on(RegistrationPage).register(login)
end

And(/^I click on submit button$/) do
  on(RegistrationPage).commit
end


Then(/^Link is appeared$/) do
  sleep 5
  on(UserAccountPage).link_account?
end