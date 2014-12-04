require 'page-object'
class WorkPage
  include PageObject

  attr_accessor :btn办公
  button(:btn办公, :xpath => "//span[text()='办 公']")

  attr_accessor :btn新闻公告
  button(:btn新闻公告, :xpath => "//div[text()='新闻公告']")
  attr_accessor :btn审批任务
  button(:btn审批任务, :xpath => "//div[text()='审批任务']")
  attr_accessor :btn公文收阅
  button(:btn公文收阅, :xpath => "//div[text()='公文收阅']")

  attr_accessor :btn报表
  button(:btn报表, :xpath => "//span[text()='报\u00a0表']")

  attr_accessor :btn我的订阅
  button(:btn我的订阅, :xpath => "//div[text()='我的订阅']")

  attr_accessor :btn我的收阅
  button(:btn我的收阅, :xpath => "//div[text()='我的收阅']")

  attr_accessor :btn我的报表
  button(:btn我的报表, :xpath => "//div[text()='我的报表']")

end