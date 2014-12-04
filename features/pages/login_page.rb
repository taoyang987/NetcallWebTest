require 'selenium-webdriver'
require 'page-object'
# require_relative '../../features/pages/index_page'
# module LoginPage
class LoginPage

  attr_accessor :enterprise, :username, :password, :login, :btn使用申请, :btn忘记密码
  include PageObject
  text_field(:enterprise, :name => 'enterprise')
  text_field(:username, :name => 'name')
  text_field(:password, :name => 'password')
  button(:login, :xpath => "//span[text()='登录']")
  button(:btn使用申请, :xpath => "//span[contains(text(), '使用申请')]")
  button(:btn忘记密码, :xpath => "//span[contains(text(), '忘记密码')]")

  def LoginWith(enterprise, username, password)
    self.enterprise=enterprise
    self.username=username
    self.password=password
    login
  end

  def LoginWithPage(enterprise, username, password, dr)
    self.enterprise=enterprise
    self.username=username
    self.password=password
    login
    wait=Selenium::WebDriver::Wait.new(:timeout => 20)
    wait.until { IndexPage.new(dr).divTitle }
  end
end


