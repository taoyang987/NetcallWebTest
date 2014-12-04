require_relative '../../features/pages/login_page'
require_relative '../../features/pages/index_page'
# require 'test/unit'
# require 'test/unit'
require 'selenium-webdriver'
require 'test/unit/assertions'

Given(/^默认账号登录$/) do
  step '导航到登录界面'
  @loginPage=LoginPage.new(@dr)
  @loginPage.LoginWithPage '03504', '903496', '', @dr
  @indexPage = IndexPage.new(@dr)
  @wait.until { @indexPage.btn设置_element.when_present }
end

And(/^输入账号 (\d+)$/) do |user|
  @loginPage.username =user
end

And(/^输入密码 (.*?)$/) do |pass|
  @loginPage.password =pass
end

And(/^点击登录$/) do
  @loginPage.login
end

Then(/^登录到首页$/) do
  @indexPage=IndexPage.new(@dr)
  @wait.until { @indexPage.divTitle }
end

Given(/^导航到登录界面$/) do
  @loginPage=LoginPage.new(@dr)
  @wait.until { @loginPage.enterprise }
end

When(/^输入企业号 (.*)$/) do |num|
  @loginPage.enterprise =num
end

Then(/^提示内容 (.*)$/) do |tip|
  @wait.until { @dr.find_element :xpath => "//div[contains(text(),#{tip})]" }
end

And(/^点击删除按钮$/) do
  btns=@dr.find_elements :css => 'div.x-clear-icon'
  # length=btns.list-1
  # for i in 0..length do
  #   if btns[i].displayed?
  #     btns[i].click
  #     break
  #   else
  #     next
  #   end
  # end
  # 0.upto(btns.list-1){}
  # length.times do |t|
  # ubtil
  btns.each do |btn|
    if btn.displayed?
      btn.click
      break
    else
      next
    end
  end
  # for btn in btns
  #   if btn.displayed?
  #     btn.click
  #     break
  #   else
  #     next
  #   end
  # end
end

Then(/^校验结果为空$/) do
  expect(@loginPage.username).to eql('')
  expect(@loginPage.enterprise).to eql('')
  expect(@loginPage.password).to eql('')
end