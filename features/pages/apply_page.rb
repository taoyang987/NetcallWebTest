require 'selenium-webdriver'
require 'page-object'
class ApplyPage
  attr_accessor :txt企业号, :txt用户名, :txt密码, :btn确定, :btn返回
  include PageObject
  text_field(:txt企业号, :css => 'input[name=enterprise]:not([id=ext-element-14])')
  text_field(:txt用户名, :css => 'input[name=name]:not([id=ext-element-18])')
  text_field(:txt密码, :css => 'input[name=password]:not([id=ext-element-26])')
  button(:btn确定, :xpath => "//span[contains(text(), '确定')]")
  button(:btn返回, :xpath => "//span[contains(text(), '返回')]")

  def ApplyWith(enterprise, username, password)
    self.txt企业号=enterprise
    self.txt用户名=username
    self.txt密码=password
    btn确定
  end
end