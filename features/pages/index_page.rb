require 'selenium-webdriver'
require 'page-object'
class IndexPage
  attr_accessor :btn消息, :btn工作, :btn通讯录, :btn设置, :divTitle
  include PageObject
  button(:btn消息, :xpath => "//span[text()='消息']")
  button(:btn工作, :xpath => "//span[contains(text(), '工作')]")
  button(:btn通讯录, :xpath => "//span[contains(text(), '通讯录')]")
  # span(:btn设置, :xpath=>"//span[contains(text(), '设置')]")
  button(:btn设置, :xpath => "//span[contains(text(), '设置')]")
  div(:divTitle, :xpath => "//div[contains(text(), '新中大软件')]")
  attr_accessor :btn新的朋友
  div(:btn新的朋友, :xpath => "//span[text()=' 新的朋友']")
  attr_accessor :btn组织结构
  div(:btn组织结构, :xpath => "//span[text()=' 组织结构']")
  attr_accessor :btn我参加的群
  div(:btn我参加的群, :xpath => "//span[text()=' 我参加的群']")

  #消息界面
  attr_accessor :btn审批任务
  button(:btn审批任务, :xpath => "//div[text()='审批任务 ']")
  attr_accessor :btn公文收阅
  button(:btn公文收阅, :xpath => "//div[text()='公文收阅 ']")

  attr_accessor :btn消息数量
  button(:btn消息数量, :xpath => "//*[text()='李庭忠 ']/div/div")

  attr_accessor :div审批任务名
  div(:div审批任务名, :xpath => "//div[contains(text(),'审批任务')]//span[@style='overflow: hidden;white-space: nowrap; text-overflow: ellipsis;']")

end
