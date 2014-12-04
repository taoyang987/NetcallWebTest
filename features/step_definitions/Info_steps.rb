require_relative '../../features/pages/login_page'
require_relative '../../features/pages/index_page'
require_relative '../../features/pages/apply_page'
require 'selenium-webdriver'

Given(/^导航到个人信息页面$/) do
  step '默认账号登录'
  @indexPage=IndexPage.new(@dr) if @indexPage.nil?
  @indexPage.btn设置
  @infoPage=MyInfo.new(@dr)
  @infoPage.btn个人信息
  # assert_equal "abc","abc","hwat dfsdf"
end

When(/^点击修改头像按钮$/) do
  # @wait.until{@infoPage.btn头像}
  sleep 1
  @infoPage.btn头像
end

And(/^点击'从相册中选择'$/) do
  # @wait.until{@infoPage.btn从相册中选择_element.style("visibility")=="visible"}
  @wait.until { @infoPage.btn从相册中选择_element.when_visible }
  @infoPage.btn从相册中选择
  @infoPage.text
end

Then(/^选择对话框消失$/) do
  @wait.until { @infoPage.btn从相册中选择_element.when_not_visible }
end


And(/^点击 (.*) 按钮$/) do |button|
  # btns=@dr.find_elements(:xpath=>"//span[contains(text(), '#{button}')]")
  # if btns.size==0
  btn=@dr.find_element(:xpath => "//span[contains(text(), '#{button}')]")
  # else
  #   btn=btns[0]
  # end
  @wait.until { btn.displayed? }
  btn.click
end

Then(/^返回到了个人信息页面$/) do
  @wait.until { @infoPage.div个人信息? }

end

And(/^删除信息$/) do
  if @infoPage.txtInfo.empty?
    flag=true
    @infoPage.txtInfo ='测试信息'
  end
  # @infoPage.btn删除
  # strJquery="var headID=document.getElementsByTagName(\"head\")[0];" +"var newScript = document.createElement('script');" +"newScript.type='text/javascript';" +"newScript.src='http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js';" +"headID.appendChild(newScript);";
  # @dr.execute_script(strJquery)
  # strJQSel='div.x-clear-icon:visible'
  # strJQSel='span:contains("保存")'
  # strJQSel="$(\""+"span:contains('返回')"+ "\").click();"
  # @dr.execute_script(strJQSel)
  divs=@dr.find_elements(:css => 'div.x-clear-icon')
  divs[1].click #删除按钮为第二个元素
  # @dr.find_element(:css=>'div.x-clear-icon:visible').click
  @strInfo=@infoPage.txtInfo
  # @infoPage.btn保存
  sleep 1
  @dr.find_element(:xpath => "//span[contains(text(), '保存')]").click
  if flag
    step '点击 返回 按钮'
  end
end

Then(/^校验(.*)信息$/) do |info|
  step '返回到了个人信息页面'
  sleep 1
  step "点击 #{info} DIV按钮"
  @wait.until { @infoPage.txtInfo==@strInfo }
end

When(/^点击昵称按钮$/) do
  sleep 1
  @infoPage.btn昵称
  strTmp=@infoPage.txtInfo
  if strTmp.empty?
    p "原先信息为空"
  end
end

And(/^输入信息 (.*)/) do |nick|
  strtmp=@infoPage.txtInfo
  @infoPage.txtInfo =nick
  @strInfo=@infoPage.txtInfo
  # @infoPage.btn保存
  sleep 1
  @dr.find_element(:xpath => "//span[contains(text(), '保存')]").click
  if strtmp==nick
    step '点击 返回 按钮' #填写信息相同时,点击保存不会自动跳转
  end
end

When(/^点击 (.*) DIV按钮$/) do |button|
  # btn=@dr.find_element(:xpath=>"//div[contains(text(), '#{button}')]")
  # @wait.until{btn.displayed?}
  # sleep 2
  # btn.click
  sleep 1
  @dr.find_element(:xpath => "//div[text()='#{button}']").click
end


Then(/^校验注册单位$/) do
  step '返回到了个人信息页面'
  step '点击 注册单位 div按钮'
  @wait.until { @infoPage.txtInfo==@strInfo }
end

Then(/^校验电话号码$/) do
  step '返回到了个人信息页面'
  step '点击 联系电话 DIV按钮'
  # @wait.until{@infoPage.txtInfo==@strInfo}
  expect(@infoPage.txtInfo).to eql(@strInfo)
end

Then(/^校验电子邮箱$/) do
  step '返回到了个人信息页面'
  step '点击 电子邮箱 DIV按钮'
  @wait.until { @infoPage.txtInfo==@strInfo }
end