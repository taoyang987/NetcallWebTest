require_relative '../pages/contract_page'
require_relative '../../features/pages/chat_page'

Given(/^导航到顾光雄详细资料界面$/) do
  step '导航到登录界面'
  @loginPage=LoginPage.new(@dr)
  @loginPage.LoginWithPage '03504', '903496', '', @dr
  @indexPage2 = IndexPage.new(@dr)
  @indexPage2.btn通讯录
  @contractPage=ContractPage.new(@dr)
  @contractPage.wait_until { @contractPage.text.include? '新的朋友' }
  # @contactPage.btn顾光雄
  name='顾光雄'
  step "搜索联系人 #{name}" #屏幕太小得借助搜索功能
  # sleep 3
  element = @dr.find_element(:xpath => "//div[contains(@style,'position:absolute') and contains(text(),'#{name}')]")
  # @dr.execute_script("arguments[0].scroll")
  # @dr.execute_script("arguments[0].scrollIntoView(true);", element);
  element.click
  @chatPage=ChatPage.new(@dr)
  @chatPage.wait_until { @chatPage.text.include? '详细资料' }

end

Then(/^跳转到了通讯录界面$/) do
  if @contractPage.nil?
    @contractPage=ContractPage.new(@dr)
  end
  step '点击删除按钮'
  @contractPage.wait_until { @contractPage.text.include? '新的朋友' }
end


When(/^点击通话按钮$/) do
  sleep 1
  @chatPage.btn电话
end

Then(/^校验通话功能$/) do
end

When(/^点击短信按钮$/) do
  sleep 1
  @chatPage.btn短信
end

Then(/^校验短信功能$/) do
end

Given(/^进入到与顾光雄聊天界面$/) do
  step '导航到顾光雄详细资料界面'
  # @chatPage.btn发消息
  sleep 3
  @dr.find_element(:xpath => "//span[text()='发消息']").click
  @chatPage.wait_until { @chatPage.text.include? '顾光雄' }
end

Then(/^跳转到了消息界面$/) do
  @chatPage.wait_until { @chatPage.text.include? '审批任务' }
end

When(/^发送文本消息 (.*)$/) do |message|
  @text=message
  sleep 3
  @chatPage.txt消息框=message
  @chatPage.btn发送
  @wait.until { @dr.find_element :xpath => "//div[text()='#{message}  ']" }
end

Then(/^登录顾光雄的账号903507检验$/) do
  @wait.until { @dr2.find_element :xpath => "//span[contains(text(),'#{@text}')]" }
end

When(/^发送表情$/) do
  @chatPage.btn发送图片
  @chatPage.btn表情
  @chatPage.img表情
  @chatPage.btn发送图片
  @strface='[打脸] '
  expect(@chatPage.txt消息框).to include(@strface)
  @chatPage.btn发送
  @wait.until { @chatPage.imgFace }
end

# Then(/^登录顾光雄的账号903507检验表情$/) do
#   pending
# end

When(/^发送文本消息混合表情$/) do
  @text='与你聊天'
  @chatPage.txt消息框=@text
  @chatPage.btn发送图片
  @chatPage.btn表情
  @chatPage.img表情
  @chatPage.btn发送图片
  @strface='[打脸]'
  expect(@chatPage.txt消息框).to include(@text)
  expect(@chatPage.txt消息框).to include(@strface)
  @chatPage.btn发送
  @wait.until { @chatPage.imgFace }
end

When(/^发送图片消息$/) do
  @chatPage.btn发送图片
  @chatPage.btn图片
end

When(/^拍照并发送该图片$/) do
  @chatPage.btn发送图片
  @chatPage.btn拍照
end

When(/^发送语音消息$/) do
  @chatPage.btn语音
  @chatPage.wait_until { @chatPage.text.include? '按住说话' }
end

Given(/^进入到聊天群 (.+)$/) do |num|
  step '导航到通讯录页面'
  @groupNum=num
  @contractPage.btn我参加的群
  element=@dr.find_element(:xpath => "//div[contains(text(),'#{num}')]")
  @dr.execute_script("arguments[0].scrollIntoView(true);", element);
  # @contractPage.button_element(:xpath=>"//div[text()='#{num}']").click
  element.click
  @contractPage.wait_until { @contractPage.text.include? "#{num}" }
  @chatPage=ChatPage.new(@dr) if @chatPage.nil?
end

Then(/^登录顾光雄的账号903507检验群聊信息$/) do
  # @dr2.find_element(:xpath=>"//div[text()='#{@groupNum}']").click
  # # @wait.until{@dr2.find_element :xpath=>"//span[contains(text(),'#{@text}')]"}
  # @chat2=ChatPage.new(@dr2)
  # @wait.until{@chat2.text.include?@text}

  @wait.until { @dr2.find_element :xpath => "//*[contains(text(),'#{@text}')]" }
end


Then(/^登录田敏的账号904243检验群聊信息$/) do

  @main_user='李庭忠'
  # str="#{@main_user}：#{@text}"
  @wait.until { @dr2.find_element(:xpath => "//span[contains(text(),'#{@main_user}')]") }
  @wait.until { @dr2.find_element(:xpath => "//span[contains(text(),'#{@text}')]") }
  # @dr2.quit
end

Then(/^检验消息数量标志消失$/) do
  @indexPage2=IndexPage.new(@dr2)
  # txt=@indexPage2.btn消息数量_element.text
  txt=@dr2.find_element(:xpath=>"//*[text()='李庭忠 ']/div/div").text
  p txt
  @indexPage2.btn消息数量
  # step '返回'
  @dr2.find_element(:xpath => "//span[text()='返回']").click
  expect(@dr2.check_element(:xpath=>"//*[text()='李庭忠 ']/div/div")).to be false

end