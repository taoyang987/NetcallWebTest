require 'page-object'
require_relative 'set_page'
class MyInfo < SetPage

  attr_accessor :btn头像, :btn姓名, :btn昵称, :btnNC号, :btn用户名, :btn注册单位, :btn联系电话, :btn电子邮箱, :btn拍一张, :btn取消, :div个人信息, :btn从相册中选择, :txtInfo, :btn保存, :btn删除
  include PageObject
  button(:btn头像, :xpath => "//div[contains(text(), '头像')]")
  button(:btn姓名, :xpath => "//div[contains(text(), '姓名')]")
  button(:btn昵称, :xpath => "//div[contains(text(), '昵称')]")
  button(:btnNC号, :xpath => "//div[contains(text(), 'nc号')]")
  button(:btn用户名, :xpath => "//div[contains(text(), '用户名')]")
  button(:btn注册单位, :xpath => "//div[contains(text(), '注册单位')]")
  button(:btn联系电话, :xpath => "//div[contains(text(), '联系电话')]")
  button(:btn电子邮箱, :xpath => "//div[contains(text(), '电子邮箱')]")
  button(:btn从相册中选择, :xpath => "//span[contains(text(), '从相册中选择')]")
  button(:btn拍一张, :xpath => "//span[contains(text(), '拍一张')]")
  button(:btn取消, :xpath => "//span[contains(text(), '取消')]")
  button(:div个人信息, :xpath => "//div[contains(text(), '个人信息')]")
  text_field(:txtInfo, :name => 'newsetting')
  button(:btn保存, :xpath => "//span[contains(text(), '保存')]")
  button(:btn删除, :css => "#ext-input-2 > div.x-clear-icon")
end