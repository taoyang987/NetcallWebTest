require 'cucumber'
require 'selenium-webdriver'
require 'page-object'
require 'page-object/platforms/selenium_webdriver/element'
require_relative '../pages/index_page'
require_relative '../pages/login_page'
require_relative '../../features/CommonModule'
$ip='192.168.6.21'
$proname='netcall_mobile'
# include IndexPage
# include LoginPage
# dr=Selenium::WebDriver.for :chrome, :switches =>%w[--disable-web-security]
# wait=Selenium::WebDriver::Wait.new(:timeout=>20)
Before do |scenario|
  include CommonModule
  dr=Selenium::WebDriver.for :chrome, :switches => %w[--disable-web-security]

  dr.manage.timeouts.implicit_wait =20
  wait=Selenium::WebDriver::Wait.new(:timeout => 10)
  @dr=dr
  @wait=wait
  @dr.manage.window.maximize
  @dr.get 'http://'+$ip+'/'+$proname+'/'

  # @wait.until{@dr.find_element :xpath => "//div[contains(text(),'登录']"}
  # strJquery="var headID=document.getElementsByTagName(\"head\")[0];" +"var newScript = document.createElement('script');" +"newScript.type='text/javascript';" +"newScript.src='http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js';" +"headID.appendChild(newScript);";
  #test
  # p MySubscribePage.ZDH最大_element.identifier
  # p @dr.check_element(:xpath => "//td[text()='aaaaa']")
  # p @dr.title
end

After do |scenario|
  if scenario.failed?
    Dir::mkdir('screenshot') if not File.directory?('screenshot')
    @dr.save_screenshot("screenshot/#{scenario.__id__}.png")
    embed("screenshot/#{scenario.__id__}.png", "image/png", "SCREENSHOT")
  end
  unless scenario.failed?
    @dr.quit
  end
  # @dr.quit
end

# at_exit do
#   dr.quit
# end

Before('@chat') do
  dr2=Selenium::WebDriver.for :chrome, :switches => %w[--disable-web-security]
  dr2.manage.timeouts.implicit_wait =20
  @dr2=dr2
  @dr2.get 'http://'+$ip+'/'+$proname+'/'
  @loginPage2=LoginPage.new(@dr2)
  @loginPage2.LoginWithPage '03504', '903507', '', @dr2
end

Before('@second') do
  dr2=Selenium::WebDriver.for :chrome, :switches => %w[--disable-web-security]
  dr2.manage.timeouts.implicit_wait =20
  @dr2=dr2
  @dr2.get 'http://'+$ip+'/'+$proname+'/'
  @dr2.manage.window.maximize
  @loginPage2=LoginPage.new(@dr2)
end

After('@second') do
  @dr2.quit
end

Before('@groupchat') do
  # @indexPage2=IndexPage.new(@dr2)
  # @indexPage2.btn通讯录
  # @contract2=ContractPage.new(@dr2)
  # @contract2.btn我参加的群
  # @contract2.button_element(:xpath=>"//div[text()='#{num}']").click
  # @dr2.find_element(:xpath=>"//div[text()='#{num}']").click
  # @contract2.wait_until{@contractPage.text.include?"#{num}"}
end

After('@chat') do
  @dr2.quit
end

After('@newgroup') do
  step "场景后解散群"
  step '执行解散群'
end
