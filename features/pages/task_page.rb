require 'page-object'
class TaskPage<WorkBasic
  include PageObject
  #审批任务
  attr_accessor :btn办任务
  button(:btn办任务, :xpath => "//div[@class='x-inner']/div[@class='x-innerhtml' and contains(text(),'办任务')]")

  attr_accessor :btn待办任务
  button(:btn待办任务, :xpath => "//div[text()='待办任务']")
  attr_accessor :btn已办任务
  button(:btn已办任务, :xpath => "//div[@class='type-list-item']/div[text()='已办任务']")
  attr_accessor :btn我发起的流程
  button(:btn我发起的流程, :xpath => "//div[text()='我发起的流程']")
  attr_accessor :btn排序
  button(:btn排序, :xpath => "//div[contains(@style,'resources/images/work/time.png')]")
  attr_accessor :btn最新在前
  button(:btn最新在前, :xpath => "//span[text()='最新在前']")
  attr_accessor :btn最早在前
  button(:btn最早在前, :xpath => "//span[text()='最早在前']")
  #任务详细
  attr_accessor :btn任务详细
  button(:btn任务详细, :xpath => "//span[text()='任务详细']")
  attr_accessor :btn流转历史
  button(:btn流转历史, :xpath => "//span[text()='流转历史']")
  attr_accessor :btn下一节点
  button(:btn下一节点, :xpath => "//span[text()='下一节点']")
  attr_accessor :btn签名
  button(:btn签名, :xpath => "//div[@style='width: 43px !important; height: 43px !important; background-image: url(http://'+$ip+'/'+$proname+'/resources/images/sign.png);'")
  attr_accessor :btn表单
  button(:btn表单, :xpath => "//span[text()='表单']")
  attr_accessor :btn驳回
  button(:btn驳回, :xpath => "//font[text()='驳回']")
  attr_accessor :btn转签
  button(:btn转签, :xpath => "//font[text()='转签']")
  attr_accessor :btn提交
  button(:btn提交, :xpath => "//font[text()='提交']")
  attr_accessor :txt审批意见
  text_area(:txt审批意见, :xpath => '//textarea')


  #常用语
  attr_accessor :btn同意
  button(:btn同意, :xpath => "//div[text()='同意！']")
  attr_accessor :btn再送审
  button(:btn再送审, :xpath => "//div[text()='请仔细修改再送审！']")


  #转签
  attr_accessor :btn最近联系人
  button(:btn最近联系人, :xpath => "//font[text()='最近联系人']")
  attr_accessor :btn操作员
  button(:btn操作员, :xpath => "//font[text()='操作员']")
  attr_accessor :btn完成
  button(:btn完成, :xpath => "//span[text()='完成']")
  attr_accessor :txt搜索
  button(:txt搜索, :xpath => "//input[@placeholder='Search']")
  attr_accessor :txt审批任务搜索
  button(:txt审批任务搜索, :xpath => "//input[@placeholder='在全部审批任务中搜索']")
end