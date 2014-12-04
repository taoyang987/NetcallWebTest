require 'page-object'
require_relative 'set_page'
class GeneralPage<SetPage
  attr_accessor :btn消息设置, :btn聊天背景, :btn关于, :btn退出账号, :btn接受新消息通知, :btn通知不显示消息详情, :btn通知不显示消息详情, :btn不接收业务消息, :btn回车键发送消息, :btn声音, :btn振动, :btn从相册中选择, :btn拍一张, :btn清空背景, :btn功能介绍, :btn帮助与反馈, :btn检查新版本, :btn条款

  include PageObject
  button(:btn消息设置, :xpath => "//div[contains(text(), '消息设置')]")
  button(:btn聊天背景, :xpath => "//div[contains(text(), '聊天背景')]")
  button(:btn关于, :xpath => "//label[contains(text(), '关于')]")

  button(:btn退出账号, :xpath => "//span[contains(text(), '退出账号')]")

  #消息设置
  button(:btn接受新消息通知, :id => 'ext-thumb-1')
  button(:btn通知不显示消息详情, :id => 'ext-thumb-2')
  button(:btn不接收业务消息, :id => 'ext-thumb-3')
  button(:btn回车键发送消息, :id => 'ext-thumb-4')
  button(:btn声音, :id => 'ext-thumb-5')
  button(:btn振动, :id => 'ext-thumb-6')

  #聊天背景
  button(:btn从相册中选择, :xpath => "//span[contains(text(), '从相册中选择')]")
  button(:btn拍一张, :xpath => "//span[contains(text(), '拍一张')]")
  button(:btn清空背景, :xpath => "//span[contains(text(), '清空背景')]")

  #关于
  button(:btn功能介绍, :xpath => "//div[contains(text(), '功能介绍')]")
  button(:btn帮助与反馈, :xpath => "//div[contains(text(), '意见反馈')]")
  button(:btn检查新版本, :xpath => "//div[contains(text(), '检查新版本')]")
  button(:btn条款, :xpath => "//span[contains(text(), '《使用条款与隐私政策》')]")


  attr_accessor :btn接受新消息通知, :btn通知不显示消息详情, :btn不接收业务消息, :btn回车键发送消息, :btn声音, :btn震动
  #消息设置
  button(:btn接受新消息通知, :id => 'ext-thumb-1')
  button(:btn通知不显示消息详情, :id => 'ext-thumb-2')
  button(:btn不接收业务消息, :id => 'ext-thumb-3')
  button(:btn回车键发送消息, :id => 'ext-thumb-4')
  button(:btn声音, :id => 'ext-thumb-5')
  button(:btn震动, :id => 'ext-thumb-6')

end