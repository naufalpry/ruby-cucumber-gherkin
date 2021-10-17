require 'selenium-webdriver'
require 'rubygems'
require 'rspec'

driver = Selenium::WebDriver.for:chrome                                     # webdriver with chromedriver

Given("open amazon sign up") do
  driver.manage.window.maximize
  driver.navigate.to "https://www.amazon.com/"
  driver.manage.timeouts.implicit_wait = 10
end

Then("sign up") do
    driver.find_element(:id,'nav-link-accountList-nav-line-1').click                
    driver.manage.timeouts.implicit_wait = 10
    driver.find_element(:id,'createAccountSubmit').click  
    driver.manage.timeouts.implicit_wait = 10
    driver.find_element(:id,'ap_customer_name').send_keys 'Akun tester'             
    driver.manage.timeouts.implicit_wait = 10                    
    driver.find_element(:id,'ap_email').send_keys 'cumatester66@gmail.com'          
    driver.find_element(:id,'ap_password').send_keys 'Admin123'                  
    driver.find_element(:id,'ap_password_check').send_keys 'Admin123'          
    driver.find_element(:id,'continue').click                                       
    driver.manage.timeouts.implicit_wait = 10                                                                       
end

Then("validate sign up") do
    # labelTextSignup = driver.find_element(:id,'home_children_button').text
    # sleep(2)
    # puts(labelTextSignup)
    # expect(labelTextSignup).to eq('Hello, akun')
    driver.find_element(:xpath, '//header[@class='page-title-heading page-header_header_SMm9A']//button[@class='d-inline-flex btn btn-primary btn-with-icon']').click
    labelTextalready = driver.find_element(:xpath, '//*[contains(text(), "Email address already in use")]').text
    driver.manage.timeouts.implicit_wait = 10
    puts(labelTextalready)
    expect(labelTextalready).to eq('Email address already in use')
    
    driver.close()
end