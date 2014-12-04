#require 'rubygems'
require 'selenium-webdriver'
require 'page-object'
require_relative 'features/pages/login_page'
require_relative  'features/pages/index_page'
require 'test/unit/assertions'
#extend LoginPage

@driver=Selenium::WebDriver.for :chrome, :switches =>%w[--disable-web-security]
#driver = Selenium::WebDriver.for :chrome, :switches => %w[--ignore-certificate-errors --disable-popup-blocking --disable-translate]
 # caps = Selenium::WebDriver::Remote::Capabilities.chrome("chromeOptions" => {"args" => [ "--disable-web-security" ]})
 # driver = Selenium::WebDriver.for :remote, url: 'http://'+$ip+':4444/wd/hub', desired_capabilities: caps
#driver=Selenium::WebDriver.for :firefox
@driver.get 'http://'+$ip+'/'+$proname+'/'
#wait.until{driver.title.downcase.start_with?"Netcall"}
wait=Selenium::WebDriver::Wait.new(:timeout=>20)
#enterprise=wait.until{driver.find_element :id=>"ext-element-14"}
# enterprise=driver.find_element :id=>"ext-element-14"
# wait.until{enterprise}
# enterprise.send_keys "03504"
# userName=driver.find_element :id=>"ext-element-18"
# userName.send_keys "902231"
# passWord=driver.fin
#
#
#
# d_element :id=>"ext-element-26"
# passWord.send_keys ""
# btnSubmit=driver.find_element :id=>"ext-element-30"
# btnSubmit.click
# begin
#   tip=wait.until{driver.find_element :id=>"messageShowLabel"}
#
#   puts "Page title is #{driver.title}"
# ensure
#   driver.quit
# end
#puts "Page title is #{driver.title}"
# assert_equal "abc","abc","hwat dfsdf"
page=LoginPage.new(@driver)
page.enterprise_element.when_present(timeout=3)
#wait.until{page.enterprise}
page.enterprise=03504
a=@driver.find_element(:id=>'ext-element-14')
puts @driver.execute_script("return arguments[0].textContent", a)
p @driver.find_element(:id=>'ext-element-14').text()
p @driver.find_element(:id=>'ext-element-14').value()
page.LoginWith('03504','902231','')

# page.enterprise ='03504'
# page.username='902231'
# page.login
#sleep 5
#@driver.quit

page=IndexPage.new(@driver)
# wait.until{page.divTitle}
page.divTitle_element.when_present#(timeout=30)
# @driver.find_element(:xpath=>"//span[contains(text(), '设置')]").click
page.btn设置


@driver.quit