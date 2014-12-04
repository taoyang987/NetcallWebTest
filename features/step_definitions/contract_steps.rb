require_relative '../../features/pages/contract_page'
require 'selenium-webdriver'
Given(/^导航到通讯录页面$/) do
  step '默认账号登录'
  @indexPage=IndexPage.new(@dr)
  @indexPage.btn通讯录
  @contractPage=ContractPage.new(@dr)
  @contractPage.wait_until { @contractPage.btn组织结构_element }
end

When(/^搜索联系人 (.*)$/) do |search|
  # scripts="$('input[type=search]').removeAttr('readonly')"
  # @dr.execute_script(scripts)
  # # @contractPage.txt搜索_element.click
  #只能采用这种方式点击操作
  @dr.action_click(:name=>'searchBuddy')
  # sleep 2
  @contractPage.txt搜索_element.send_keys(search)
  # @contractPage.txt搜索=search
  # @contractPage.txt搜索=search

end

Then(/^只出现 (.*) 一个人$/) do |name|
  sleep 1
  # lists=@dr.find_elements(:css => 'div.x-list-item.x-stretched.x-list-item-tpl')
  # lists=@dr.find_elements(:xpath => "//div[contains(text(),'#{name}')]")
  # num=lists.count { |list| list.displayed? }
  # expect(num).to eq(1)
  @wait.until { @dr.find_element(:xpath => "//div[contains(text(),'#{name}')]") }
end

Then(/^组织结构按钮消失$/) do
  # expect(@contractPage.btn组织结构_element.visible?).to be false
  obj=@contractPage.btn组织结构_element
  obj2=@dr.find_element(:xpath=>"//div[text()='组织结构']")
  obj2.displayed?
  obj.visible?
  obj.displayed?
  expect(@contractPage.btn组织结构_element.displayed?).to be false
end

Then(/^组织结构按钮出现$/) do
  expect(@contractPage.btn组织结构_element.visible?).to be true
end

When(/^点击字母按钮L$/) do
  @dr.find_elements(:xpath => "//div[text()='L']")[1].click #第二个才是右侧按钮
end

Then(/^跳转到L开头名单$/) do
  sleep 1
  l=@dr.find_element(:xpath => "//div[text()='L' and @class='x-innerhtml']")
  # x=l.getLocation
  # y=l.get_location
  # data=l.getElementLocation
  data=l.location
  size=l.size
  tmp=l.location_once_scrolled_into_view
  puts tmp

  # expect(data['y']+size['height']).to be<100 #坐标超过100就会显示出来
  name=@dr.find_element(:xpath => "//div[text()='刘云']")
  data2=name.location
  expect(data2['y']).to be>100
end

When(/^点击添加同事$/) do

  sleep 3
  spans=@dr.find_elements(:css => "span.x-button-icon.x-shown.add")
  spans2=spans.select { |span| span.displayed? }

  # spans2[0].action_click
  # spans2[0].click
  @dr.action.click(spans[1]).perform
  @contractPage.btn添加同事
end


When(/^删除同事 (.*)$/) do |name|
  # step "搜索联系人 #{name}"
  # sleep 3
  # # begin
  # @dr.manage.timeouts.implicit_wait =5
  # persons=@dr.find_elements(:xpath => "//div[text()='#{name}']")

  # p person.displayed?
  if @dr.check_element(:xpath=>"//div[text()='#{name}']")
    p "#{name}已经在通讯录当中"
    sleep 1
    @del=@dr.find_element(:xpath => "//div[text()='#{name}']")
    @dr.action.click_and_hold(@del).perform
    # @dr.find_element(:xpath=>"//span[text()='删除该同事']").click
    sleep 2
    @contractPage.btn删除该同事
    @wait.until { @dr.find_element(:xpath => "//div[contains(text(), '删除成功')]") }
    @contractPage.refresh
    # @dr.manage.timeouts.implicit_wait =30
    # sleep 1
    # @contractPage.refresh
    @indexPage.btn通讯录
    # step "搜索联系人 #{name}"
    # lists=@dr.find_elements(:css=>'div.x-list-item.x-stretched.x-list-item-tpl')
    # num=lists.count{|list|list.displayed?}
    # expect(num).to eq(0)
    # @wait.until{@dr.find_element(:xpath=>"//div[text()='#{name}']")}
  end
  # rescue Exception => e
  #   p "#{name}原本不在通讯录当中"
  # end
  # step '点击删除按钮'
  # sleep 2
  # 由于搜索框把其他阻挡,按Esc键取消
  # @dr.action.key_down(:escape).perform
  # sleep 1
  # @dr.action.key_up(:escape).perform
  # @dr.action.send_keys(:escape).perform
  # @dr.click
  i6p=@dr.find_element :xpath=>"//div[contains(text(),'新中大软件i6')]"
  @dr.action.click(i6p).perform
end

And(/^搜索同事并添加 (.*)$/) do |name|
  @dr.find_element(:xpath => "//div[text()='中国水利水电第九工程局有限公司']").click
  # @wait.until{@contractPage.txt搜索同事_element.enabled?}
  # @contractPage.txt搜索同事_element.click
  # @contractPage.txt搜索同事_element.send_keys name
  sleep 2
  # search=@dr.find_element(:css=>"input[name=searchAll]")
  # @dr.action.click(search).perform
  @dr.action_click(:name=>'searchAll')
  @contractPage.txt搜索同事_element.send_keys(name)
  # @dr.action.send_keys(search,'123').perform
  # search.send_keys name
  # KeyBoardHelper.press name
  sleep 2
  @wait.until { @person=@dr.find_element(:xpath => "//div[text()='#{name}' and contains(@style,'margin-left:12px')]") }
  @person.click
  sleep 1
  @contractPage.btn确定
  # @wait.until { @dr.find_element(:xpath => "//*[contains(text(), '好友请求发送成功')]") }
  # @wait.until { @dr.find_element(:xpath => "//span[@class='x-badge' and text()='1']") } #通讯录显示+1
  # @wait.until { @dr.find_element(:xpath => "//div[text()=1]") } #新的朋友显示+1
end

And(/^登录 (\d+) 通过验证$/) do |num|
  dr2=Selenium::WebDriver.for :chrome, :switches => %w[--disable-web-security]
  dr2.manage.timeouts.implicit_wait =20
  @dr2=dr2
  @dr2.get 'http://'+$ip+'/'+$proname+'/'
  @loginPage2=LoginPage.new(@dr2)
  @loginPage2.LoginWithPage '03504', num, '', @dr2
  @indexPage2=IndexPage.new(@dr2)
  @indexPage2.btn通讯录
  @contractPage2=ContractPage.new(@dr2)
  @contractPage2.btn新的朋友
  # @dr.find_element(:xpath=>"span[text()='同意')]").click
  @contractPage2.btn同意
  @contractPage2.refresh
  @indexPage2.btn通讯录
  @dr2.action_click(:name=>'searchBuddy')
  # sleep 2
  @contractPage2.txt搜索_element.send_keys(search)
  name='李庭忠'
  @dr2.find_element(:xpath => "//div[text()='#{name}']")
  @dr2.quit
end

Then(/^出现在好友列表中 (.*)$/) do |name|
  @contractPage.refresh
  @indexPage.btn通讯录
  step "搜索联系人 #{name}"
  step "只出现 #{name} 一个人"
end

When(/^简单删除同事 (.*)$/) do |name|
  step "搜索联系人 #{name}"
  sleep 3
  person=@dr.find_element(:xpath => "//div[text()='#{name}']")
  if person.displayed?
    p "#{name}已经在通讯录当中"
    sleep 1
    @del=@dr.find_element(:xpath => "//div[text()='#{name}']")
    @dr.action.click_and_hold(@del).perform
    @contractPage.btn删除该同事
  end
end

And(/^登录刘文忠通过验证$/) do
  dr2=Selenium::WebDriver.for :chrome, :switches => %w[--disable-web-security]
  dr2.manage.timeouts.implicit_wait =20
  @dr2=dr2
  @dr2.get 'http://'+$ip+'/'+$proname+'/'
  @loginPage2=LoginPage.new(@dr2)
  @loginPage2.LoginWithPage '03504', 902231, 364882795, @dr2
  @indexPage2=IndexPage.new(@dr2)
  @indexPage2.btn通讯录
  sleep 1
  @contractPage2=ContractPage.new(@dr2)
  # @wait.until { @dr.find_element(:xpath => "//span[@class='x-badge' and text()='1']") } #通讯录显示+1
  # @wait.until { @dr.find_element(:xpath => "//div[text()=1]") } #新的朋友显示+1
  @contractPage2.btn新的朋友
  # @dr.find_element(:xpath=>"span[text()='同意')]").click
  @contractPage2.btn同意
  # p @contractPage2.btn同意_element
  sleep 3
  @contractPage2.refresh
  @indexPage2.btn通讯录
  name = '李庭忠'
  # @contractPage2.txt搜索=name
  @dr2.action_click(:name=>'searchBuddy')
  # sleep 2
  @contractPage2.txt搜索_element.send_keys(name)
  sleep 3
  # lists=@dr2.find_elements(:css => 'div.x-list-item.x-stretched.x-list-item-tpl')
  # num=lists.count { |list| list.displayed? }
  # expect(num).to be>= 1
  @wait.until { @dr2.find_element(:xpath => "//div[text()='#{name}']") }
  @dr2.quit
end

And(/^搜索同事netcall号并添加 (\d+),(.*)$/) do |num, name|
  @contractPage.txt搜索同事=num
  sleep 3
  @wait.until { @person=@dr.find_element(:xpath => "//div[text()='#{name}' or text()='#{num}' and contains(@style,'margin-left:12px')]") }
  sleep 2
  @person=@dr.find_element(:xpath => "//div[text()='#{name}' or text()='#{num}' and contains(@style,'margin-left:12px')]")
  @person.click
  @contractPage.btn确定
  @wait.until { @dr.find_element(:xpath => "//div[contains(text(), '好友请求发送成功')]") }
end

And(/^登录刘文忠并拒绝$/) do
  dr2=Selenium::WebDriver.for :chrome, :switches => %w[--disable-web-security]
  dr2.manage.timeouts.implicit_wait =20
  @dr2=dr2
  @dr2.get 'http://'+$ip+'/'+$proname+'/'
  @loginPage2=LoginPage.new(@dr2)
  @loginPage2.LoginWithPage '03504', 902231, 364882795, @dr2
  @indexPage2=IndexPage.new(@dr2)
  @indexPage2.btn通讯录
  @contractPage2=ContractPage.new(@dr2)
  # @wait.until { @dr.find_element(:xpath => "//span[@class='x-badge' and text()='1']") } #通讯录显示+1
  # @wait.until { @dr.find_element(:xpath => "//div[text()=1]") } #新的朋友显示+1
sleep 1
  @contractPage2.btn新的朋友
  # @dr.find_element(:xpath=>"span[text()='同意')]").click
  @contractPage2.btn拒绝
  # p @contractPage2.btn同意_element
  sleep 3
  @contractPage2.refresh
  @indexPage2.btn通讯录
  name = '李庭忠'
  # @contractPage2.txt搜索=name
  @dr2.action_click(:name=>'searchBuddy')
  @contractPage2.txt搜索_element.send_keys(name)
  sleep 3
  lists=@dr2.find_elements(:xpath => "//div[contains(@style,'position:absolute') and contains(text(),'#{name}')]")
  num=lists.count { |list| list.displayed? }
  expect(num).to eq(0)
  @dr2.quit
end

Then(/^好友列表中不存在 (.*)$/) do |name|
  @contractPage.refresh
  @indexPage.btn通讯录
  step "搜索联系人 #{name}"
  lists=@dr.find_elements(:xpath => "//div[contains(@style,'position:absolute') and contains(text(),'#{name}')]")
  num=lists.count { |list| list.displayed? }
  expect(num).to eq(0)
end

When(/^导航到添加同事目录$/) do
  step '点击添加同事'
end


And(/^全选根目录组织$/) do
  @dr.find_element(:css => "div[orgid='OrgNestedListStore-root/SDJJ']").click
end

Then(/^跳转到了根目录组织界面$/) do
  expect(@contractPage.text.include? '新中大软件').to be true
end

And(/^进入组织目录 (.*)$/) do |arrTree|
  arrGroup=arrTree.split(/-/)
  arrGroup.each do |name|
    puts name
    ele=@dr.find_element(:xpath => "//div[text()='#{name}']")
    @dr.execute_script("arguments[0].scrollIntoView(true);", ele)
    sleep 1
    ele.click
  end
end

And(/^选择组织结构目录树 (.*)$/) do |name|
  sleep 1

  @check=@dr.find_element(:css => "div[orgid='OrgNestedListStore-root/SDJJ/A005/A005.02']")
  @check.click
  step "点击 #{name} DIV按钮"
end

Then(/^验证结点已选择$/) do
  step "点击 返回 按钮"
  sleep 1
  expect(@dr.find_element(:css => "div[orgid='OrgNestedListStore-root/SDJJ/A005/A005.02']").css_value('background-image')).to include "resources/images/checkbox2.png)"
  step "点击 返回 按钮"
  sleep 1
  step "点击 返回 按钮"
  sleep 1
  @checkup=@dr.find_element(:css => "div[orgid='OrgNestedListStore-root/SDJJ']")
  expect(@checkup.css_value('background-image')).to include "resources/images/checkbox1.png)"
end


Then(/^注销$/) do
  @indexPage.refresh
  @indexPage.btn设置
  @generalPage=GeneralPage.new(@dr)
  # @generalPage.wait_until{@generalPage.btn通用_element.when_visible}
  step '点击 退出账号 DIV按钮'
  step '点击 是 按钮'
end