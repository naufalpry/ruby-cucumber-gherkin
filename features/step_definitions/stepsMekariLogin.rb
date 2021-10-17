require 'selenium-webdriver'
require 'rubygems'
require 'rspec'
require 'cucumber'
require 'rails'

driver = Selenium::WebDriver.for:chrome                                     # webdriver with chromedriver

Given("open Mekari") do
  driver.manage.window.maximize
  driver.navigate.to "https://sandbox-sso.mekari.com/users/sign_in"         # direct to site
  driver.manage.timeouts.implicit_wait = 10
  driver.save_screenshot "1.png"
end

When("User login into Jurnal") do                                                               
    driver.find_element(:id, 'user_email').send_keys 'cumatester66@gmail.com'
    driver.find_element(:id, 'user_password').send_keys 'terserahelu'
    driver.find_element(:id, 'new-signin-button').click
    driver.manage.timeouts.implicit_wait = 10       
    driver.save_screenshot "2.png"                                                                   
end

Then("validate login") do
    labelText = driver.find_element(:xpath, '//*[contains(text(), "Selamat datang, naufal prayogo")]').text
    driver.manage.timeouts.implicit_wait = 10
    puts(labelText)
    expect(labelText).to eq('Selamat datang, naufal prayogo')
    driver.save_screenshot "3.png"
end

Then("Buat Penjualan Baru") do
    driver.manage.timeouts.implicit_wait = 10
    driver.find_element(:id, 'btn-jurnal').click
    driver.find_element(:id, 'sales-li').click
    driver.manage.timeouts.implicit_wait = 10
    driver.find_element(:xpath, '//*[@id="dropdown-activator-shadow"]//*[contains(text(), "Buat penjualan baru")]').click
    driver.manage.timeouts.implicit_wait = 10
    driver.find_element(:xpath, '//*[contains(text(), "Penagihan Penjualan")]').click
    driver.save_screenshot "4.png"
    driver.manage.timeouts.implicit_wait = 10
end

Then("Select dropdown existing customer on the list") do
    driver.find_element(:id, 'select_contact').click
    driver.save_screenshot "5.png"
    driver.find_element(:xpath, '//div[@id="select_contact"]//*[contains(text(), "naufal")]').click
    driver.manage.timeouts.implicit_wait = 10
    sleep(2)
end

Then("Select dropdown customer with add new customer") do
    # UBAH NAMA EMAIL address
    driver.find_element(:id, 'select_contact').click
    driver.manage.timeouts.implicit_wait = 10
    driver.find_element(:xpath, '//div[@id="select_contact"]//*[contains(text(), "Tambah baru")]').click
    driver.manage.timeouts.implicit_wait = 10
    driver.find_element(:id, 'display_name').send_keys  'andi gusmasan'
    driver.find_element(:id, 'c_email').send_keys  'andigus@getnada.com'
    driver.find_element(:id, 'telephone').send_keys  '6241123456739'
    driver.find_element(:id, 'billing_address').send_keys  'Jalan raya lapan cisauk'
    driver.find_element(:id, 'shipping_address').send_keys  'Jalan raya lapan cisauk'
    driver.manage.timeouts.implicit_wait = 10
    driver.find_element(:xpath, '//div[@id="desktopBannerWrapped"]//button[@onclick="moeRemoveBanner()"]').click
    driver.manage.timeouts.implicit_wait = 10
    driver.find_element(:xpath, '//footer[@id="modal_create_contact___BV_modal_footer_"]//button[@class="d-inline-flex btn btn-primary"]').click
    driver.manage.timeouts.implicit_wait = 10
    driver.save_screenshot "6.png"
    sleep(3)
end

Then("Select dropdown existing product on the list") do
    driver.execute_script "window.scrollBy(200,400)"
    sleep 2
    # element = driver.find_element(:id, 'address')
    # driver.execute_script "arguments[0].scrollIntoView();", element
    driver.manage.timeouts.implicit_wait = 10
    driver.find_element(:id, 'select_product_1').click
    driver.manage.timeouts.implicit_wait = 10
    driver.find_element(:xpath, '//div[@id="select_product_1"]//ul//*[contains(text(), "Penjualan")]').click
    driver.find_element(:xpath, '//textarea[@placeholder="Deskripsi"]').send_keys 'Penjualan'
    driver.find_element(:id, 'product_014146050').send_keys '100000'
    driver.save_screenshot "7.png"
    driver.find_element(:xpath, '//button[@class="d-inline-flex btn btn-ghost btn-sm btn-icon-only"]').click
    driver.manage.timeouts.implicit_wait = 10
    sleep(3)
end
    
Then("Select dropdown customer with add new product") do
  element = driver.find_element(:id, 'address')
  driver.execute_script "arguments[0].scrollIntoView();", element
  driver.manage.timeouts.implicit_wait = 10
  driver.find_element(:id, 'select_product_1').click
  driver.manage.timeouts.implicit_wait = 10
  driver.find_element(:xpath, '//div[@id="select_product_1"]//ul//*[contains(text(), " + Tambah baru ")]').click
  driver.manage.timeouts.implicit_wait = 10
  driver.find_element(:id, 'name').send_keys 'Buah'
  driver.find_element(:id, 'product_code').send_keys 'Ad1213'
  driver.find_element(:id, 'sell_price_per_unit').send_keys '1000'
  driver.find_element(:xpath, '//div[@id="modal_create_product-1___BV_modal_content_"]//*[contains (text(), "Simpan")]').click
  driver.manage.timeouts.implicit_wait = 10
  driver.save_screenshot "8.png"
end

And("Select dropdown customer with add new product with selecting other buy account") do
    driver.execute_script "window.scrollTo(0, -document.body.scrollHeight)"
    driver.manage.timeouts.implicit_wait = 10
    driver.find_element(:id, 'select_contact').click
    driver.find_element(:xpath, '//div[@id="select_contact"]//*[contains(text(), "jhon")]').click
    driver.manage.timeouts.implicit_wait = 10
    driver.manage.timeouts.implicit_wait = 10
    element = driver.find_element(:id, 'address')
    driver.execute_script "arguments[0].scrollIntoView();", element
    driver.manage.timeouts.implicit_wait = 10
    driver.find_element(:id, 'select_product_1').click
    driver.manage.timeouts.implicit_wait = 10
    driver.find_element(:xpath, '//div[@id="select_product_1"]//ul//*[contains(text(), " + Tambah baru ")]').click
    driver.manage.timeouts.implicit_wait = 10
    driver.find_element(:xpath, '//*[contains(text(), "I buy this item")]').click
    driver.manage.timeouts.implicit_wait = 10
    driver.find_element(:xpath, '//div[@id="desktopBannerWrapped"]//button[@onclick="moeRemoveBanner()"]').click
    driver.manage.timeouts.implicit_wait = 10
    driver.find_element(:id, 'name').send_keys 'Jambu'
    driver.manage.timeouts.implicit_wait = 10
    driver.find_element(:id, 'product_code').send_keys 'Add1234'
    driver.find_element(:id, 'sell_price_per_unit').send_keys '1000'
    driver.manage.timeouts.implicit_wait = 10
    driver.find_element(:xpath, '//div[@id="modal_create_product-1___BV_modal_content_"]//*[contains (text(), "Simpan")]').click
    driver.manage.timeouts.implicit_wait = 10
    driver.save_screenshot "9.png"
end


