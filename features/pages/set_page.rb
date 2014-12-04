require 'page-object'
class SetPage
  attr_accessor :btn个人信息, :btn通用, :btn返回
  include PageObject
  button(:btn个人信息, :xpath => "//*[@id='ext-element-212']/div")
  button(:btn通用, :xpath => "//label[contains(text(), '通用')]")
  button(:btn返回, :xpath => "//span[contains(text(), '返回')]")
end