require 'page-object'
class GroupSetPage
  include PageObject
  attr_accessor :btn取消
  button(:btn取消, :xpath => "//span[text()='取消']")
  attr_accessor :btn保存
  button(:btn保存, :xpath => "//span[text()='保存']")
  attr_accessor :btn返回
  button(:btn返回, :xpath => "//span[text()='返回']")
  attr_accessor :btnNC号
  button(:btnNC号, :xpath => "//div[contains(text(),'nc号:')]")
  attr_accessor :btn群名称
  button(:btn群名称, :xpath => "//img[@src='resources/images/headshots/conferenceHeadshot.png']/parent::*")
  # button(:btn群名称, :xpath => "//div[contains(@src,'conferenceHeadshot')]")
  attr_accessor :txt群名称
  text_field(:txt群名称, :xpath => "//input[@type='text']")
  attr_accessor :btn删除
  button(:btn删除, :xpath => "//input[@type='text']/following::div[@class='x-clear-icon']")
  attr_accessor :btn群公告
  button(:btn群公告, :xpath => "//div[contains(text(),'群公告')]")
  attr_accessor :btn群成员
  button(:btn群成员, :xpath => "//div[text()='群成员']")
  attr_accessor :btn邀请新成员
  button(:btn邀请新成员, :xpath => "//div[text()='邀请新成员']")
  attr_accessor :btn清空聊天记录
  button(:btn清空聊天记录, :xpath => "//div[text()='清空聊天记录']")
  attr_accessor :btn解散该群
  button(:btn解散该群, :xpath => "//*[contains(text(),'解散该群')]")
  attr_accessor :btn退出该群
  button(:btn退出该群, :xpath => "//span[text()='退出该群']")
  attr_accessor :txt群公告
  text_area(:txt群公告, :xpath => "//div[@class='x-unsized x-field-input']/following::textarea")
  attr_accessor :btn群图标按钮
  button(:btn群图标按钮, :xpath => "//span[@class='x-button-icon x-shown user']")
  attr_accessor :btn不能为空
  button(:btn不能为空, :xpath => "//div[text()='不能为空']")
  attr_accessor :btn确定
  button(:btn确定, :xpath => "//span[text()='确定']")
  attr_accessor :btn公告删除
  button(:btn公告删除, :xpath => "//textarea[@class='x-input-el x-input-text x-form-field']/following-sibling::div[@class='x-clear-icon']")
  attr_accessor :btn是
  button(:btn是, :xpath => "//*[text()='是']")
  attr_accessor :btn群号
  div(:btn群号, :xpath => "//div[contains(text(),'号')]")

end