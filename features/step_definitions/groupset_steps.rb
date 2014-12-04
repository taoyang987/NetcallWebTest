require 'rspec/expectations'
require_relative '../pages/group_set_page'
Given(/^导航到(.*)群的设置页面$/) do |num|
  step '进入到群列表'
  # @contractPage.
  # imgs=@dr.find_elements(:css=>"img[src='resources/images/headshots/conferenceHeadshot.png']")
  # imgs[1].click #75975固定位置在第二个群
  element=@dr.find_element(:xpath => "//*[contains(text(),'#{num}')]")

  element.click
  @groupSet=GroupSetPage.new(@dr)
  @groupSet.btn群图标按钮
  @groupSet.wait_until { @groupSet.text.include? "#{num}" }
end

Given(/^场景后解散群$/) do

  @indexPage=IndexPage.new(@dr)
  @indexPage.refresh
  @indexPage.btn通讯录
  @contractPage=ContractPage.new(@dr)
  @contractPage.wait_until { @contractPage.btn组织结构_element }

  @contractPage=ContractPage.new(@dr)
  @contractPage.btn我参加的群

  p @groupName
  sleep 3
  element=@dr.find_visible_element(:xpath => "//*[contains(text(),'#{@groupName}')]")
# @dr.action_click(:xpath => "//*[contains(text(),'#{@groupName}')]")

  element.old_click
  @groupSet=GroupSetPage.new(@dr)
  @groupSet.btn群图标按钮
  @groupSet.wait_until { @groupSet.text.include? "#{@groupName}" }
end

Given(/^进入到群列表$/) do
  step '导航到通讯录页面'
  @contractPage=ContractPage.new(@dr)
  @contractPage.btn我参加的群
end

When(/^修改群名称为 (.*)$/) do |name|
  @name=name
  @groupSet.btn群名称
  @groupSet.txt群名称=name
  @groupSet.btn保存
  step '提示内容 修改群名称成功'
end

Then(/^校验群名称$/) do
  # ele=@dr.find_element(:xpath => "//img[@src='resources/images/headshots/conferenceHeadshot.png']/parent::*")
  # p ele.text
  # expect(ele.text).to eq(@name)#,"校验结果#{@name}"
  @wait.until { @groupSet.text.include? @name }
end

When(/^删除群名称$/) do
  @groupSet.btn删除
  expect(@groupSet.txt群名称).to eq('')
  @groupSet.btn保存
end

When(/^导航到群名称修改页面$/) do
  @groupSet.btn群名称
end

Then(/^群名称不能为空$/) do
  @wait.until { @groupSet.btn不能为空_element.exists? }
  @groupSet.btn确定
end

Then(/^跳转到了群设置页面$/) do
  @groupSet.wait_until { @groupSet.btn群名称_element.exists? }
end

When(/^修改群公告为 (.*)$/) do |announce|
  @announce=announce
  @groupSet.btn群公告
  @groupSet.txt群公告=announce
  @groupSet.btn保存
end

Then(/^校验群公告$/) do
  @groupSet.btn群公告
  expect(@groupSet.txt群公告).to eql(@announce)
end

When(/^导航到群公告修改页面$/) do
  @groupSet=GroupSetPage.new(@dr) if @groupSet.nil?
  sleep 2
  @groupSet.btn群公告
end

When(/^删除群公告$/) do
  @groupSet.txt群公告='公告内容' if @groupSet.txt群公告.empty?
  @groupSet.btn公告删除
  @groupSet.btn保存
  @groupSet.wait_until { @groupSet.btn群名称_element.exists? }
  @announce=''
end

Then(/^校验清空聊天记录效果$/) do
  step '提示内容 清楚成功'
end

Given(/^导航到创建群界面$/) do
  step '导航到通讯录页面'
  @contractPage=ContractPage.new(@dr)
  step '点击添加按钮'
  @contractPage.btn发起群聊
  @contractPage.wait_until { @contractPage.text.include? '邀请参与者' }
  # @groupSet=GroupSetPage.new(@dr)if @groupSet.nil?
end

When (/^点击添加按钮$/) do
  spans=@dr.find_elements(:css => "span.x-button-icon.x-shown.add")
  spans2=spans.select { |span| span.displayed? }
  spans2[0].click
end

When(/^选择固定群友创建$/) do
  # sleep 1
  @arrNames=['陈兴友', '田敏']
  @arrNames.each do |name|
    sleep 1
    @dr.find_element(:xpath => "//div[@class='test']/following::div[text()='#{name}']").click
  end
  step '点击 确定(2) 按钮'
  # sleep 2
  @chatPage=ChatPage.new(@dr)
  @chatPage.txt消息框_element.when_present
  group=@dr.find_element(:xpath => "//div[@class='x-unsized x-title x-floating' and @style='padding-top: 0px; z-index: 8 !important;']/div[text()!='我的设置']")
  @groupName=@dr.execute_script("return arguments[0].textContent", group)
  # p group.text

#   群名称固定了,要手动修改
  @groupSet=GroupSetPage.new(@dr) if @groupSet.nil?
  @groupSet.btn群图标按钮
  @groupName=@groupSet.btn群号_element.text
  p '群名称为:'+@groupName
  step "修改群名称为 #{@groupName}"
  sleep 2
  step '返回'
end

Then(/^校验群$/) do

  # p "群号为"+@groupName
  @groupSet=GroupSetPage.new(@dr) if @groupSet.nil?
  @groupSet.wait_until { @groupSet.btn群图标按钮_element.visible? }
  @groupSet.btn群图标按钮
  @groupSet.btn群成员
  # @groupMan=@dr.find_elements(:xpath=>"//div[@style='height:37px;padding-top:inherit']")
  # @groupManTxt=@groupMan.collect { |ele| ele.text }
  @arrNames<<'李庭忠'
  @arrElements=[]
  @arrNames.each do |name|
    # expect(@groupManTxt).to include(name)
    element=@dr.find_element(:xpath => "//div[text()='#{name}']")
    # p element.text
    # puts @dr.execute_script("return arguments[0].textContent", element)
    # p @dr.find_element(:xpath=>"//div[text()='#{name}']").text
  end

end

And(/^邀请 (.*) 加入群$/) do |name|
  @groupSet=GroupSetPage.new(@dr) if @groupSet.nil?
  @groupSet.wait_until { @groupSet.btn群图标按钮_element.visible? }
  @groupSet.btn群图标按钮
  sleep 1
  @groupSet.btn邀请新成员
  sleep 1
  @dr.find_element(:xpath => "//div[text()='#{name}']").click
  sleep 1
  @dr.find_element(:xpath => "//span[contains(text(),'确定')]").click
end

Then(/^校验 (.*) 在群成员中$/) do |name|
  @groupSet.btn群成员
  @dr.find_element(:xpath => "//div[text()='#{name}']")
end

And(/^解散群$/) do
  @groupSet=GroupSetPage.new(@dr) if @groupSet.nil?
  @groupSet.wait_until { @groupSet.btn群图标按钮_element.visible? }
  # sleep 1
  @groupSet.btn群图标按钮
  sleep 1
  @groupSet.btn解散该群
  @groupSet.btn是
end

And(/^执行解散群$/) do
  @groupSet=GroupSetPage.new(@dr) if @groupSet.nil?
  sleep 1
  @groupSet.btn解散该群
  @groupSet.btn是
end

Then(/^校验群已解散$/) do
  @wait.until { @indexPage.btn通讯录_element.visible? }
  @indexPage.btn通讯录
  sleep 1
  @contract=ContractPage.new(@dr)
  @contract.btn我参加的群_element.when_visible
  @contract.btn我参加的群
  p @groupName
  @dr.manage.timeouts.implicit_wait=5
  groups=@dr.find_elements(:xpath => "//div[text()='#{@groupName}']")
  expect(groups.length).to eql(0)
end

And(/^以田敏904243登录群$/) do
  #step '登录第二账号'
  @loginPage2.LoginWithPage '03504', 904243, '', @dr2
end

And(/^退出群$/) do
  @indexPage2=IndexPage.new(@dr2)
  @indexPage2.btn通讯录
  @contract2=ContractPage.new(@dr2)
  @contract2.btn我参加的群
  element=@dr2.find_element(:xpath => "//div[text()='#{@groupName}']")
  @dr2.execute_script("arguments[0].scrollIntoView(true);", element)
  element.click
  @group2=GroupSetPage.new(@dr2)
  @group2.btn群图标按钮
  @group2.btn退出该群
  @group2.btn是
end


Then(/^校验群已退出$/) do
  @indexPage2.btn通讯录
  sleep 1
  @contract2.btn我参加的群
  @dr2.manage.timeouts.implicit_wait=5
  lists=@dr2.find_elements(:xpath => "//div[text()='#{@groupName}']")
  expect(lists.length).to eql(0)
end

And '登录第二账号' do #|user|
  user=904243
  pass=''
  @loginPage2.LoginWithPage '03504', user, pass, @dr2
end

Given(/^田敏904243导航到75975群的设置页面$/) do
  step '导航到登录界面'
  @loginPage=LoginPage.new(@dr)
  @loginPage.LoginWithPage '03504', '904243', '', @dr
  @indexPage = IndexPage.new(@dr)
  @wait.until { @indexPage.btn设置_element.when_present }
  @indexPage.btn通讯录
  # step '导航到通讯录页面'
  # step '进入到群列表'
  @contractPage=ContractPage.new(@dr)
  @contractPage.btn我参加的群
  @groupSet=GroupSetPage.new(@dr) if @group.nil?
  element=@dr.find_element(:xpath => "//*[contains(text(),'75975')]")
  @dr.execute_script("arguments[0].scrollIntoView(true);", element)
  element.click
  @groupSet.btn群图标按钮
end

When(/^chk群公告无效修改$/) do
  @groupSet.btn群公告
  # @groupSet.txt群公告='非常修改群公告内容'
  expect(@groupSet.txt群公告_element.attribute('readonly')).to eql('true')
end

When(/^goto群名称修改界面$/) do
  @groupSet.btn群名称
end

Then(/^chk群名称无法修改$/) do
  expect(@groupSet.txt群名称_element.attribute('readonly')).to eql('true')
end

