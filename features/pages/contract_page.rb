require 'page-object'
class ContractPage

  attr_accessor :txt搜索, :btn删除, :btn新的朋友, :btn删除, :btn新的朋友, :btn组织结构, :btn我参加的群
  attr_accessor :btn发起群聊, :btn添加同事, :btn顾光雄, :btnL, :txt搜索同事, :btn确定, :btn同意, :btn拒绝, :btn删除该同事
  include PageObject
  text_field(:txt搜索, :xpath => "//input[@class='x-input-el x-form-field x-input-search']")
  # text_field(:txt搜索, :css => "input[type=search]")
  text_field(:txt搜索同事, :css => "input[name=searchAll]")
  button(:btn删除, :css => "div.x-clear-icon")
  button(:btn新的朋友, :xpath => "//div[text()='新的朋友']")
  button(:btn组织结构, :xpath => "//div[text()='组织结构']")
  button(:btn我参加的群, :xpath => "//div[text()='我参加的群']")
  button(:btn发起群聊, :xpath => "//span[text()='发起群聊']")
  button(:btn添加同事, :xpath => "//span[text()='添加同事']")
  button(:btn确定, :xpath => "//span[text()='确定']")
  button(:btn同意, :xpath => "//span[text()='同意']")
  button(:btn拒绝, :xpath => "//span[text()='拒绝']")
  button(:btn删除该同事, :xpath => "//*[text()='删除该同事']")
  button(:btn顾光雄, :xpath => "//div[text()='顾光雄']")


end