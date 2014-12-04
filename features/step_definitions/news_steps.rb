# include CommonModel
Given(/^初始变量$/) do
  @newsPage=NewsPage.new(@dr)
  $title=ENV['title'] unless ENV['title'].nil? #cucumber 指令中带入
  p $title
  @indexPage=IndexPage.new(@dr) if @indexPage.nil?
  @workPage=WorkPage.new(@dr)
  @taskPage=TaskPage.new(@dr)
  @docPage=DocPage.new(@dr)
end

And(/^登录902231账号$/) do
  # @dr.execute_script('window.focus();')
  step 'LoginAs 902231 364882795'
end

Given(/^新建公告流程$/) do
  p '在i6p上手工操作'
end

And(/^chk消息界面审批任务通知$/) do
  @indexPage.btn消息
  @indexPage.btn审批任务_element.when_visible
  sleep 2
  strArr=$title.split("发文")
  # expect(@indexPage.text).to include($taskName)
  strArr.each { |str|
    p str
    @dr.find_element(:xpath=>"//*[contains(text(),'#{str}')]")
    # @wait.until {
    #   @workPage.text.include? str
    # }
  }

  eles=@dr.find_elements(:xpath => "//div[@style='width:20px; height:20px; border-radius:10px;-moz-border-radius: 10px;-webkit-border-radius: 10px;background-color:#fc3e39; float:right; margin:0 0 0 0;text-align:center;border:0px solid white;border-color:white;font-size:.65em;line-height:19px;color:white;position:absolute;left:40px;']")
  @taskNum=eles[0].text
  $taskName=@indexPage.div审批任务名_element.text
  p $taskName

end

And(/^chk消息界面及工作界面进入$/) do
  step "clk #{$taskName} span按钮"
  sleep 2
  # expect(@indexPage.text).to include($taskName)
  @indexPage.wait_until { @indexPage.text.include? $taskName }
  step '返回'
  @indexPage.btn工作
  @workPage.btn审批任务
  # expect(@workPage.text).to include($taskName)
  @wait.until { @workPage.text.include? $taskName }
end

And(/^chk审批任务界面功能$/) do
  # class TaskPage
  #   button(:btnName, :xpath => "//label[text()='刘文忠']")
  # end
  # @taskPage=TaskPage.new(@dr)
  # @taskPage.btnName.when_visible
  # @taskPage.btnName
  sleep 3
  @taskPage.btn办任务
  @taskPage.btn已办任务
  @dr.manage.timeouts.implicit_wait =5
  elements=@dr.find_elements(:xpath => "//td[text()='#{$taskName}']")

  @taskPage.btn办任务
  @taskPage.btn我发起的流程
  @taskPage.wait_until { @taskPage.text.include? "#{$title}" }

  # @taskPage.btn排序
  @taskPage.btn排序_element.visibleClick
  @taskPage.btn最早在前
  sleep 3
  elements=@dr.find_elements(:xpath => "//td[@style='width: 100%;text-overflow:ellipsis;white-space:nowrap;overflow:hidden;font-size: 1.1em']")
  @firstTask='1234'
  expect(elements[0].text).to eql(@firstTask)
  @taskPage.btn排序
  @taskPage.btn最新在前
  sleep 3
  elements=@dr.find_elements(:xpath => "//td[@style='width: 100%;text-overflow:ellipsis;white-space:nowrap;overflow:hidden;font-size: 1.1em']")
  # expect(elements[elements.length-1].text).to eql('陶杨测试')

  # @taskPage.btn搜索_element.visibleClick
  btnsSearch=@dr.find_elements(:xpath=>"//div[@class='x-img x-img-image x-img-background x-sized x-paint-monitored x-size-monitored']")
  btn=btnsSearch.select{|btn|btn.displayed?}
  btn.click
  @taskPage.txt审批任务搜索_element.send_keys $title
  sleep 3
  elements=@dr.find_elements(:xpath => "//td[@style='width: 100%;text-overflow:ellipsis;white-space:nowrap;overflow:hidden;font-size: 1.1em' and text()='#{$taskName}']")
  expect(elements.length).to eql(2)
  sleep 2
  step '返回'
end

And(/^转签给(\d+)$/) do |user|
  @dr.find_element(:xpath => "//div[@class='x-inner']/div[@class='x-innerhtml' and contains(text(),'我发起的流程')]").click
  @taskPage.btn待办任务
  ele=@dr.find_element(:xpath => "//div[text()='#{$taskName}']")
  @wait.until { ele.displayed? }
  ele.click
  @taskPage.btn转签
  step 'tip提示内容 审批意见不能为空'
  @taskPage.txt审批意见_element.click
  sleep 5
  @taskPage.btn同意
  @taskPage.btn转签
  @taskPage.btn操作员
  # @taskPage.txt搜索=user
  ele=@dr.find_element(:xpath => "//input[@placeholder='Search']")
  ele.send_keys user
  sleep 2
  @dr.find_element(:xpath => "//div[contains(text(),'#{user}')]").click
  @taskPage.btn完成
  step 'tip提示内容 转签成功'
end

And(/^登录(\d+)$/) do |user|
  dr2=Selenium::WebDriver.for :chrome, :switches => %w[--disable-web-security]
  dr2.manage.timeouts.implicit_wait =20
  @dr2=dr2
  @dr2.get 'http://'+$ip+'/'+$proname+'/'
  @loginPage2=LoginPage.new(@dr2)
  @loginPage2.LoginWithPage '03504', user, '', @dr2
end

And(/^校验任务详细及流转历史$/) do
  @taskPage.refresh
  @indexPage.btn工作
  sleep 3
  @workPage.btn审批任务
  sleep 1
  @taskPage.btn办任务
  # @taskPage.btn待办任务
  sleep 2
  @taskPage.btn已办任务
  # sleep 2
  @dr.find_element(:xpath => "//td[text()='#{$taskName}']").click
  @wait.until { @taskPage.text.include? "任务详细" }
  taskDetails=["任务描述: #{$taskName}", "发起人: 刘文忠", "同意！【用户刘文忠转签给用户李和】"]
  # flowHistory=[""]
  taskDetails.each { |detail| expect(@taskPage.text).to include(detail) }
end

And(/^审核通过$/) do
  @indexPage2=IndexPage.new(@dr2)
  sleep 1
  @task = @dr2.find_element(:xpath => "//span[text()='#{$taskName}']")
  @task.click
  @dr2.find_element(:xpath => "//div[text()='#{$taskName}']").click
  @taskPage2=TaskPage.new(@dr2)
  @taskPage2.btn提交
  step 'tip提示内容 审批意见不能为空'
  sleep 5
  @taskPage2.txt审批意见_element.click
  @taskPage2.btn同意
  @taskPage2.btn提交
  # wait = Object::Selenium::WebDriver::Wait.new({:timeout => timeout, :message => "Element still present in #{timeout} seconds"})
  @wait.until do
    not_present = false
    begin
      not_present = false if @task and @task.displayed?
    rescue Selenium::WebDriver::Error::ObsoleteElementError
      not_present = true
    end
    not_present
  end
  @dr2.quit
end

And(/^chk新闻公告$/) do
  @taskPage.refresh
  @indexPage.btn工作
  sleep 3
  @workPage.btn新闻公告
  @newsPage=NewsPage.new(@dr)
  # expect(@newsPage.text).to be include($title)
  # @newsPage.wait_until( ,"abc"){@newsPage.text.include{$title}}
  @newsPage.wait_until { @newsPage.text.include? $title }
  # @dr.find_element(:xpath=>"//div[text()='#{$title}']").click
end

And(/^chk未阅新闻$/) do
  @newsPage.btn所有新闻
  @newsPage.btn未阅新闻
  sleep 1
  #未读消息前有红点
  @dr.manage.timeouts.implicit_wait =5
  elements=@dr.find_elements(:xpath => "//div[text()='#{$title}']/parent::td/preceding-sibling::td/child::li")
  if elements.length>0
    expect(elements[0].attribute("style")).to eql("list-style-type:disc;color: red;font-size: 20px;")
    @dr.find_element(:xpath => "//div[text()='#{$title}']").click
    p '检查附件'
    @newsPage.btn附件
    step 'tip提示内容 正在请求持久化的文件系统'
    # step 'clk 返回 span按钮'
    clk返回按钮
  end
end

And(/^chk已阅新闻$/) do
  @newsPage.btn未阅新闻
  @newsPage.btn所有新闻
  # expect(@newsPage.text).to be include?($title)
  @newsPage.wait_until { @newsPage.text.include? $title }
end

And(/^chk新中大新闻$/) do
  @newsPage.btn所有新闻
  @newsPage.btn新中大新闻
  # sleep 1
  # expect(@newsPage.text).to be include($title)
  @newsPage.wait_until { @newsPage.text.include? $title }

end

Given(/^配置校验数据$/) do
  $title='taoy2014070023'
  $taskName="刘文忠发起 [#{$title}] 的送审"
  step '登录902231账号'
end

And(/^审核驳回$/) do
  @indexPage=IndexPage.new(@dr)
  # @task = @dr.find_element(:xpath => "//span[text()='#{$taskName}']")
  # @wait.until{@task.displayed?}
  # @task.click
  @task = @dr.find_element(:xpath => "//div[text()='#{$taskName}']")
  @task.click
  @taskPage.btn提交
  step 'tip提示内容 审批意见不能为空'
  sleep 5
  @taskPage.txt审批意见_element.click
  @taskPage.btn同意
  @taskPage.btn提交
  # wait = Object::Selenium::WebDriver::Wait.new({:timeout => timeout, :message => "Element still present in #{timeout} seconds"})
  @wait.until do
    not_present = false
    begin
      not_present = false if @task and @task.displayed?
    rescue Selenium::WebDriver::Error::ObsoleteElementError
      not_present = true
    end
    not_present
  end
end

Given(/^新建发文流程$/) do
  p 'i6p上操作'
end

And(/^chk消息界面公文收阅通知$/) do
  @indexPage.btn消息
  @indexPage.btn审批任务_element.when_visible
  sleep 2
  # expect(@indexPage.text).to include($taskName)
  @wait.until { @workPage.text.include? $title }
  eles=@dr.find_elements(:xpath => "//div[@style='width:20px; height:20px; border-radius:10px;-moz-border-radius: 10px;-webkit-border-radius: 10px;background-color:#fc3e39; float:right; margin:0 0 0 0;text-align:center;border:0px solid white;border-color:white;font-size:.65em;line-height:19px;color:white;position:absolute;left:40px;']")
  @taskNum=eles[0].text
end

And(/^chk公文收阅消息界面及工作界面进入$/) do
  $taskName=$title
  step "clk #{$taskName} span按钮"
  sleep 2
  # expect(@indexPage.text).to include($taskName)
  @indexPage.wait_until { @indexPage.text.include? $taskName }
  step '返回'
  @indexPage.btn工作
  @workPage.btn公文收阅
  # expect(@workPage.text).to include($taskName)
  @wait.until { @workPage.text.include? $taskName }
end

And(/^chk未阅公文$/) do
  @docPage.btn阅公文
  @docPage.btn未阅公文
  @docPage.wait_until { @docPage.text.include? $taskName }
  class DocPage
    button(:btnEle, :xpath => "//div[text()='#{$taskName}']")
  end
  @docPage=DocPage.new(@dr)
  @docPage.btnEle
end

And(/^chk公文内容$/) do

  @docPage.wait_until { @docPage.text.include? $taskName }
  @docPage.wait_until { @docPage.text.include? '同意！' }
  sleep 2
  @docPage.btn附件
  class DocPage
    button(:btnDoc, :xpath => "//span[contains(text(),'.doc')]")
  end
  @docPage=DocPage.new(@dr)
  @docPage.btnDoc_element.when_visible
  @docPage.btnDoc
  step 'tip提示内容 正在请求持久化的文件系统'
  # step '返回'
  # step '返回'
end

And(/^chk公文类别$/) do
  step '重新进入公文收阅列表'
  p '默认数据类别为 天宫檄文'
  @docPage.btn阅公文
  sleep 1
  @docPage.btn天宫檄文
  @dr.find_element(:xpath => "//div[text()='#{$taskName}']").location_once_scrolled_into_view
  @docPage.wait_until { @docPage.text.include? $taskName }
end

And(/^重新进入公文收阅列表$/) do
  @indexPage.refresh
  sleep 2
  @indexPage.btn工作_element.when_visible
  @indexPage.btn工作
  sleep 2
  @workPage.btn公文收阅_element.when_visible
  @workPage.btn公文收阅
  # @indexPage.btn公文收阅_element.when_visible
  # @indexPage.btn公文收阅
end

And(/^chk公文已阅$/) do
  step '重新进入公文收阅列表'
  @docPage.btn阅公文
  @docPage.btn全部公文
  @dr.find_element(:xpath => "//div[text()='#{$taskName}']").location_once_scrolled_into_view
  @docPage.wait_until { @docPage.text.include? $taskName }
end

And(/^chk公文搜索$/) do
  @docPage.btn搜索
  @docPage.txt搜索=$taskName
  sleep 3
  eles=@dr.find_elements(:xpath => "//div[@style='font-size: 1.1em;width:100%;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;' and text()='#{$taskName}']")
  # eles2=eles.select{|ele|ele.displayed?}
  expect(eles.length).to eql(2)
end

Given(/^公文配置校验数据$/) do
  $title='taoy发文2014070028'
  $taskName=$title
end

And(/^chk更多类型新闻$/) do
  @newsPage.btn当前类别
  @newsPage.btn更多类型_element.when_visible
  @newsPage.btn更多类型
  @newsPage.btn类型中的新中大新闻_element.visibleClick
  @newsPage.wait_until { @newsPage.text.include? $title }
end

And(/^chk新闻公告内容$/) do
  @dr.find_element(:xpath => "//div[text()='#{$title}']").click
  @newsPage.wait_until { @newsPage.text.include? '类型:新中大新闻 录入人:刘文忠 发布时间' }
  p '检查附件'
  @newsPage.btn附件
  step 'tip提示内容 正在请求持久化的文件系统'
end

