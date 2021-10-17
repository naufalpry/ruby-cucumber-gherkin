require 'selenium-webdriver'
require 'rubygems'
require 'rspec'

driver = Selenium::WebDriver.for:chrome                                     # webdriver with chromedriver

Given("open amazon") do
  driver.navigate.to "https://www.amazon.com/"         # direct to site
  driver.manage.window.maximize
  driver.manage.timeouts.implicit_wait = 10
end

Then("signIn amazon") do
    driver.find_element(:id, 'nav-link-accountList-nav-line-1').click                 # Click menu login for sign up
    driver.manage.timeouts.implicit_wait = 10
    driver.find_element(:id,'ap_email').send_keys 'cumatester66@gmail.com'            # Input email account
    driver.find_element(:id,'continue').click                                         # click continue
    driver.manage.timeouts.implicit_wait = 10
    driver.find_element(:id,'ap_password').send_keys 'T3rserahelu'                    # Input password                                                # sleep/pause 2 second
    driver.manage.timeouts.implicit_wait = 10
    driver.find_element(:id,'signInSubmit').click                                     # click signInSubmit
    driver.manage.timeouts.implicit_wait = 10
end

Then("validate sign in") do
    labelText = driver.find_element(:id,'nav-link-accountList-nav-line-1').text
    driver.manage.timeouts.implicit_wait = 10
    puts(labelText)
    expect(labelText).to eq('Hello, akun')
    driver.close()
end