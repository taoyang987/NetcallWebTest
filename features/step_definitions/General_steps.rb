require_relative '../../features/pages/login_page'
require_relative '../../features/pages/index_page'
require_relative '../../features/pages/general_page'
require 'selenium-webdriver'
require 'test/unit/assertions'
require 'rspec'


Given(/^导航到通用页面$/) do
  step '默认账号登录'
  @indexPage.btn设置
  @generalPage=GeneralPage.new(@dr)
  # @generalPage.wait_until{@generalPage.btn通用_element.when_visible}
  # @generalPage.btn通用
end

Then(/^跳转到了我的设置页面$/) do
  @generalPage.wait_until { @generalPage.text.include? "我的设置" }
  # expect(@dr.find_element(:xpath=>"//div[contains(text(), '我的设置')]")).to be_displayed?
end

Then(/^跳转到了登录页面$/) do
  @wait.until { @loginPage.login_element.when_present }
end

When(/^点击 (.*) label按钮$/) do |button|
  sleep 3
  @dr.find_element(:xpath => "//label[contains(text(), '#{button}')]").click
end

Then(/^校验功能介绍$/) do
  @wait.until { @generalPage.btn功能介绍_element.when_present }
end

Then(/^校验帮助与反馈$/) do
  @wait.until { @generalPage.btn帮助与反馈_element.when_present }
end

Then(/^校验检查新版本$/) do
  # sleep 2
  @generalPage.btn检查新版本
  # @generalPage.btn检查新版本 #不清楚要双击两次的原因
  @wait.until { @dr.find_element(:xpath => "//div[contains(text(),'正在检查更新')]") }
  # @dr.find_element(:xpath => "//div[contains(text(),#{tip})]").click
end

Then(/^校验条款$/) do
  @generalPage.btn条款
  @generalPage.wait_until { @generalPage.text.include? "服务条款" }
end

Given(/^导航到消息设置页面$/) do
  step '导航到通用页面'
  @generalPage.btn消息设置
  @generalPage.wait_until { @generalPage.text.include? "消息设置" }
end

When(/^校验接受新消息通知按钮/) do
  sleep 2
  styleOld=@generalPage.btn接受新消息通知_element.attribute("style")
  if styleOld=='-webkit-transform: translate3d(39px, 0px, 0px);'
    flag=true
  else
    flag=false
  end
  @generalPage.btn接受新消息通知
  sleep 3
  if flag
    # assert_equal '-webkit-transform: translate3d(0px, 0px, 0px);',@generalPage.btn接受新消息通知_element.attribute("style")
    expect(@generalPage.btn接受新消息通知_element.attribute("style")).to eql('-webkit-transform: translate3d(0px, 0px, 0px);')
  else
    # assert_equal '-webkit-transform: translate3d(39px, 0px, 0px);',@generalPage.btn接受新消息通知_element.attribute("style")
    expect(@generalPage.btn接受新消息通知_element.attribute("style")).to eql('-webkit-transform: translate3d(39px, 0px, 0px);')
  end
  @generalPage.btn接受新消息通知
  sleep 3
  if flag
    # assert_equal '-webkit-transform: translate3d(39px, 0px, 0px);',@generalPage.btn接受新消息通知_element.attribute("style")
    expect(@generalPage.btn接受新消息通知_element.attribute("style")).to eql('-webkit-transform: translate3d(39px, 0px, 0px);')
  else
    # assert_equal '-webkit-transform: translate3d(0px, 0px, 0px);',@generalPage.btn接受新消息通知_element.attribute("style")
    expect(@generalPage.btn接受新消息通知_element.attribute("style")).to eql('-webkit-transform: translate3d(0px, 0px, 0px);')
  end
end

When(/^校验通知不显示消息详情按钮$/) do
  sleep 2
  styleOld=@generalPage.btn通知不显示消息详情_element.attribute("style")
  if styleOld=='-webkit-transform: translate3d(39px, 0px, 0px);'
    flag=true
  else
    flag=false
  end
  @generalPage.btn通知不显示消息详情
  sleep 3
  if flag
    # assert_equal '-webkit-transform: translate3d(0px, 0px, 0px);'
    expect(@generalPage.btn通知不显示消息详情_element.attribute("style")).to eql('-webkit-transform: translate3d(0px, 0px, 0px);')
  else
    expect(@generalPage.btn通知不显示消息详情_element.attribute("style")).to eql('-webkit-transform: translate3d(39px, 0px, 0px);')
    # assert_equal '-webkit-transform: translate3d(39px, 0px, 0px);',@generalPage.btn通知不显示消息详情_element.attribute("style")
  end
  @generalPage.btn通知不显示消息详情
  sleep 3
  if flag
    expect(@generalPage.btn通知不显示消息详情_element.attribute("style")).to eql('-webkit-transform: translate3d(39px, 0px, 0px);')
    # assert_equal '-webkit-transform: translate3d(39px, 0px, 0px);',@generalPage.btn通知不显示消息详情_element.attribute("style")
  else
    expect(@generalPage.btn通知不显示消息详情_element.attribute("style")).to eql('-webkit-transform: translate3d(0px, 0px, 0px);')
    # assert_equal '-webkit-transform: translate3d(0px, 0px, 0px);',@generalPage.btn通知不显示消息详情_element.attribute("style")
  end
end

When(/^校验震动按钮$/) do
  sleep 2
  styleOld=@generalPage.btn震动_element.attribute("style")
  if styleOld=='-webkit-transform: translate3d(39px, 0px, 0px);'
    flag=true
  else
    flag=false
  end
  @generalPage.btn震动
  sleep 3
  if flag
    expect(@generalPage.btn震动_element.attribute("style")).to eql('-webkit-transform: translate3d(0px, 0px, 0px);')

    # assert_equal '-webkit-transform: translate3d(0px, 0px, 0px);',@generalPage.btn震动_element.attribute("style")
  else
    expect(@generalPage.btn震动_element.attribute("style")).to eql('-webkit-transform: translate3d(39px, 0px, 0px);')
    # assert_equal '-webkit-transform: translate3d(39px, 0px, 0px);',@generalPage.btn震动_element.attribute("style")
  end
  @generalPage.btn震动
  sleep 3
  if flag
    expect(@generalPage.btn震动_element.attribute("style")).to eql('-webkit-transform: translate3d(39px, 0px, 0px);')
    # assert_equal '-webkit-transform: translate3d(39px, 0px, 0px);',@generalPage.btn震动_element.attribute("style")
  else
    expect(@generalPage.btn震动_element.attribute("style")).to eql('-webkit-transform: translate3d(0px, 0px, 0px);')
    # assert_equal '-webkit-transform: translate3d(0px, 0px, 0px);',@generalPage.btn震动_element.attribute("style")
  end
end

When(/^校验声音按钮$/) do
  sleep 2
  styleOld=@generalPage.btn声音_element.attribute("style")
  if styleOld=='-webkit-transform: translate3d(39px, 0px, 0px);'
    flag=true
  else
    flag=false
  end
  @generalPage.btn声音
  sleep 3
  if flag
    expect(@generalPage.btn声音_element.attribute("style")).to eql('-webkit-transform: translate3d(0px, 0px, 0px);')
    # assert_equal '-webkit-transform: translate3d(0px, 0px, 0px);',@generalPage.btn声音_element.attribute("style")
  else
    # assert_equal '-webkit-transform: translate3d(39px, 0px, 0px);',@generalPage.btn声音_element.attribute("style")
    expect(@generalPage.btn声音_element.attribute("style")).to eql('-webkit-transform: translate3d(39px, 0px, 0px);')
  end
  @generalPage.btn声音
  sleep 3
  if flag
    # assert_equal '-webkit-transform: translate3d(39px, 0px, 0px);',@generalPage.btn声音_element.attribute("style")
    expect(@generalPage.btn声音_element.attribute("style")).to eql('-webkit-transform: translate3d(39px, 0px, 0px);')
  else
    # assert_equal '-webkit-transform: translate3d(0px, 0px, 0px);',@generalPage.btn声音_element.attribute("style")
    expect(@generalPage.btn声音_element.attribute("style")).to eql('-webkit-transform: translate3d(0px, 0px, 0px);')
  end
end

When(/^校验不接收业务消息按钮$/) do
  sleep 2
  styleOld=@generalPage.btn不接收业务消息_element.attribute("style")
  if styleOld=='-webkit-transform: translate3d(39px, 0px, 0px);'
    flag=true
  else
    flag=false
  end
  @generalPage.btn不接收业务消息
  sleep 3
  if flag
    # assert_equal '-webkit-transform: translate3d(0px, 0px, 0px);',@generalPage.btn不接收业务消息_element.attribute("style")
    expect(@generalPage.btn不接收业务消息_element.attribute("style")).to eql('-webkit-transform: translate3d(0px, 0px, 0px);')
  else
    # assert_equal '-webkit-transform: translate3d(39px, 0px, 0px);',@generalPage.btn不接收业务消息_element.attribute("style")
    expect(@generalPage.btn不接收业务消息_element.attribute("style")).to eql('-webkit-transform: translate3d(39px, 0px, 0px);')
  end
  @generalPage.btn不接收业务消息
  sleep 3
  if flag
    # assert_equal '-webkit-transform: translate3d(39px, 0px, 0px);',@generalPage.btn不接收业务消息_element.attribute("style")
    expect(@generalPage.btn不接收业务消息_element.attribute("style")).to eql('-webkit-transform: translate3d(39px, 0px, 0px);')
  else
    # assert_equal '-webkit-transform: translate3d(0px, 0px, 0px);',@generalPage.btn不接收业务消息_element.attribute("style")
    expect(@generalPage.btn不接收业务消息_element.attribute("style")).to eql('-webkit-transform: translate3d(0px, 0px, 0px);')
  end
end

When(/^校验回车键发送消息按钮$/) do
  sleep 2
  styleOld=@generalPage.btn回车键发送消息_element.attribute("style")
  if styleOld=='-webkit-transform: translate3d(39px, 0px, 0px);'
    flag=true
  else
    flag=false
  end
  @generalPage.btn回车键发送消息
  sleep 3
  if flag
    expect(@generalPage.btn回车键发送消息_element.attribute("style")).to eql('-webkit-transform: translate3d(0px, 0px, 0px);')
    # assert_equal '-webkit-transform: translate3d(0px, 0px, 0px);',@generalPage.btn回车键发送消息_element.attribute("style")
  else
    expect(@generalPage.btn回车键发送消息_element.attribute("style")).to eql('-webkit-transform: translate3d(39px, 0px, 0px);')
    # assert_equal '-webkit-transform: translate3d(39px, 0px, 0px);',@generalPage.btn回车键发送消息_element.attribute("style")
  end
  @generalPage.btn回车键发送消息
  sleep 3
  if flag
    expect(@generalPage.btn回车键发送消息_element.attribute("style")).to eql('-webkit-transform: translate3d(39px, 0px, 0px);')
    # assert_equal '-webkit-transform: translate3d(39px, 0px, 0px);',@generalPage.btn回车键发送消息_element.attribute("style")
  else
    # assert_equal '-webkit-transform: translate3d(0px, 0px, 0px);',@generalPage.btn回车键发送消息_element.attribute("style")
    expect(@generalPage.btn回车键发送消息_element.attribute("style")).to eql('-webkit-transform: translate3d(0px, 0px, 0px);')
  end
end

Given(/^导航到聊天背景设置页面$/) do
  step '默认账号登录'
  @indexPage.btn设置
  @generalPage=GeneralPage.new(@dr)
  # @generalPage.wait_until{@generalPage.btn通用_element.when_visible}
  # @generalPage.btn通用
  @generalPage.btn聊天背景
end

Then(/^返回到了通用设置页面$/) do
  @generalPage.wait_until { @generalPage.text.include? "我的设置" }
end

When(/^检验 (.*) 按钮$/) do |button|
  @wait.until { @dr.find_element :xpath => "//span[contains(text(), #{button})]" }
end

Given(/^试验断言$/) do
  expect([1, 2, 3]).to include(5)
end

Then(/^ch登录界面记忆账号信息$/) do
  # bug 80440
  @wait.until{!@loginPage.enterprise.empty?}
  @wait.until{!@loginPage.username.empty?}
end

Then(/^校验意见反馈$/) do
  # @generalPage.
end