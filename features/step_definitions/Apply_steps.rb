require_relative '../../features/pages/login_page'
require_relative '../../features/pages/index_page'
require_relative '../../features/pages/apply_page'

Given(/^导航到申请账号界面$/) do
  step '导航到登录界面'
  @loginPage=LoginPage.new(@dr)
  sleep 2
  @loginPage.btn使用申请
  @applyPage=ApplyPage.new(@dr)
  @wait.until { @applyPage.txt企业号 }
end

When(/^点击返回按钮$/) do
  # puts @applyPage.btn返回_element.style("visibility")
  @applyPage.btn返回
end

Then(/^返回到了登录页面$/) do
  @wait.until { @loginPage.enterprise }
end


When(/^输入申请账号信息:$/) do |table|
  # table is a table.hashes.keys # => [:Enterprise, :User, :Password]
  # @applyPage.txt企业号 ='03504'
  table.hashes.each do |hash|
    enter=hash['Enterprise']
    sleep 1
    @applyPage.txt企业号 =enter
    user=hash['User']
    @applyPage.txt用户名 =user
    password=hash["Password"]
    @applyPage.txt密码 =password

    # unless password.empty?
    #   @applyPage.txt密码 =password
    # end
  end
  @applyPage.btn确定
end

Then(/^提示设备已授权成功$/) do
  @wait.until { @dr.find_element :xpath => "//div[contains(text(), '此设备已经成功授权，可以登录netcall正常使用.如有疑问，请联系系统管理员.')]" }
end

Then(/^申请提示 (.*)$/) do |tip|
  @wait.until { @dr.find_element :xpath => "//div[contains(text(),#{tip})]" }
end