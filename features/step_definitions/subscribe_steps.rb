Given(/^新建报表订阅$/) do
  p 'I6p上操作'
end

And(/^进入到报表界面$/) do
  # @dr.select_window
  @indexPage.btn工作
  sleep 3
  # @workPage.btn报表_element.click
  @workPage.btn报表_element.visibleClick
  sleep 2
end

Given(/^报表变量初始化$/) do
  $title=ENV['title'] unless ENV['title'].nil? #cucumber 指令中带入
  p $title
  $flag=false
  @indexPage=IndexPage.new(@dr) if @indexPage.nil?
  @subscribe=MySubscribePage.new(@dr) if @subscribe.nil?
  @workPage=WorkPage.new(@dr) if @workPage.nil?
  @contractPage=ContractPage.new(@dr)
  #test
  # p @subscribe.ZDH最大化_element.identifier
end

And(/^chk我的订阅收到$/) do
  @workPage.btn我的订阅_element.visibleClick
  5.times do
    unless @dr.check_element({:xpath => "//td[text()='#{$title}']"}, 30)
      step '返回'
      @workPage.btn我的订阅_element.visibleClick
    end
  end
  @dr.manage.timeouts.implicit_wait=120
  @subscribe.wait_until(120, "等待120s") { @dr.find_element(:xpath => "//td[text()='#{$title}']") }
  # @mySub=@dr.find_element(:xpath => "//td[text()='#{$title}']")
  @dr.manage.timeouts.implicit_wait=20
  # @mySub.click
end

And(/^chk订阅时间查询$/) do
  # sleep 3
  # @subscribe.JSSJ结束时间
  @dr.action_click(:name => 'endtime')
  t=Time.now
  month=(t.month-1).to_s+'月'
  sleep 1
  @dr.find_element(:xpath => "//div[text()='#{month}']").click
  sleep 1
  @subscribe.span确定
  @dr.manage.timeouts.implicit_wait=10
  num=@dr.find_elements(:xpath => "//td[text()='#{$title}']").length
  expect(num).to eql(0)
  # @subscribe.JSSJ结束时间
  @dr.action_click(:name => 'endtime')
  month=t.month.to_s+'月'
  sleep 1
  @dr.find_element(:xpath => "//div[text()='#{month}']").click
  sleep 1
  @subscribe.span确定
  @subscribe.wait_until { @dr.find_element(:xpath => "//td[text()='#{$title}']") }
  # @dr.find_element(:xpath => "//td[text()='#{$title}']").click
end

And(/^chk订阅报表$/) do
  # if $title=~ /^我的报表/
  #   @dr.find_element(:xpath => "//td[text()='分公司合同总额分析表_副本']").click
  # else
  #   @dr.find_element(:xpath => "//td[text()='#{$title}']").click
  # end
  @wait.until{@subscribe.Jzz加载中_element.when_not_visible}
  sleep 5
  @subscribe.QH切换_element.visibleClick
  sleep 1
  @subscribe.XZ向左_element.visibleClick
  @subscribe.wait_until { @subscribe.DQW当前为第一页_element.when_present }
  @subscribe.span确定
  sleep 3
  # @subscribe.QH切换_element.visibleClick
  @subscribe.TX图形
  sleep 1
  # @subscribe.QH切换_element.visibleClick
  @subscribe.BG表格
  @subscribe.wait_until { @subscribe.text.include? '分公司合同总额合同收支汇总分析表' }
  sleep 1
  # @subscribe.QH切换_element.visibleClick
  @subscribe.XY向右
  @subscribe.wait_until { @dr.find_element(:xpath => "//img[contains(@src,'http://218.108.50.4:8081/rest/UpLoadFiles/RW/')]") }
  sleep 1
  # @subscribe.QH切换_element.visibleClick
  @subscribe.TX图形
  @subscribe.wait_until { @dr.find_element(:xpath => "//div[contains(@style,'background-image: url(http://218.108.50.4:8081/rest/UpLoadFiles/RW/')]") }
  sleep 1
  # @subscribe.QH切换_element.visibleClick
  @subscribe.BG表格
  @subscribe.wait_until { @subscribe.text.include? '分公司合同总额合同收支汇总分析表' }
  sleep 1
  # @subscribe.QH切换_element.visibleClick
  @subscribe.XY向右
  sleep 1
  # @subscribe.QH切换_element.visibleClick
  # @subscribe.wait_until { @subscribe.text.include? '新建空白' }
  # sleep 4
  # @subscribe.QH切换_element.visibleClick
  # @dr.action.click(@dr.find_element(:xpath=>"//div[text()='切换']")).perform
  # @dr.find_element(:xpath=>"//div[text()='切换']").click
  # @subscribe.XY向右
  @subscribe.wait_until{@subscribe.DQW当前为最后一页_element.when_present}
  @subscribe.span确定
end

And(/^chk最大化$/) do
  # if $title.nil?
    @dr.find_element(:xpath => "//td[text()='分公司合同总额分析表_副本']").click
  # else
  #   @dr.find_element(:xpath => "//td[text()='#{$title}']").click
  # end
  @subscribe.Jzz加载中_element.when_not_visible
  sleep 2
  # @subscribe.ZDH最大_element.visibleClick
    #左下角最大化按钮
  element=@dr.find_element(:xpath => "//div[contains(@style,'width: 32px !important; height: 32px !important; bottom: 5px !important; z-index: 4 !important; background-image: url(')]")
  # element=@dr.find_element(:xpath => "//div[@style='width: 32px !important; height: 32px !important; bottom: 5px !important; z-index: 4 !important; background-image: url(http://'+$ip+'/'+$proname+'/resources/images/ierw.png);']")
  @dr.action.click(element).perform
  sleep 5
  # my_handle=@dr.window_handle
  # @dr.switch_other_window
  # sleep 1
  # @dr.close
  # @dr.switch_to.window my_handle
  # @subscribe.GD更多_element.visibleClick
  # @dr.action_click(:xpath=>"//span[@style='background-image: url(http://'+$ip+'/'+$proname+'/resources/images/more.png);']")
  # @subscribe.ZDH最大化_element.visibleClick
  # @dr.switch_other_window
  # sleep 1
  # @dr.close
  # @dr.switch_to.window my_handle

  # @subscribe.attach_to_window(:url => 'http://218.108.50.4:8081/rest/UpLoadFiles/RW/')
  # # @dr.switchToWindow
  # sleep 1
  # @subscribe.browser.close
  # sleep 3
  # # @subscribe.attach_to_window(:url => 'http://'+$ip+'/'+$proname+'/')
  # @subscribe.attach_to_window(:title => 'NetCall')
  # @subscribe.GD更多
  # @subscribe.ZDH最大化_element.visibleClick
  # sleep 1
  # @subscribe.attach_to_window(:url => 'http://218.108.50.4:8081/rest/UpLoadFiles/RW/')
  # @subscribe.browser.close
  # sleep 3
  # @subscribe.attach_to_window(:title => 'NetCall')
end

And(/^转发给 (\d+) (.*)$/) do |id, name|
  @subscribe.ZF转发
  step "选择人 #{id} #{name}"
  if $flag
    @subscribe.ZT报表主题 ='转发'+$title
    @subscribe.SM报表说明 ='转发'+$title
  else
    @subscribe.SM订阅说明='转发'+$title
  end
  @dr.find_visible_element(:xpath => "//span[text()='确定']").click
  # @subscribe.span确定
end

And(/^chk转发结果$/) do
  @indexPage2=IndexPage.new(@dr2)
  @indexPage2.btn工作
  sleep 2
  @workPage2=WorkPage.new(@dr2)
  @workPage2.btn报表_element.visibleClick
  sleep 2
  @workPage2.btn我的收阅_element.visibleClick
  # @workPage2.wait_until{@workPage2.text.include?"#{$title}"}
  @workPage2.wait_until { @workPage2.text.include? "转发#{$title}" }
end

And(/^chk删除收阅$/) do
  @subscribe2=MySubscribePage.new(@dr2)
  sleep 1
  nums1=@dr2.find_elements(:xpath => "//span[text()='#{$title}']").length
  @mySub2=@dr2.find_element(:xpath => "//span[text()='#{$title}']")
  @mySub2.click
  sleep 2
  # @subscribe2.GD更多_element.visibleClick
  @subscribe2.Jzz加载中_element.when_not_visible
  @dr2.action_click(:xpath => "//span[@style='background-image: url(http://'+$ip+'/'+$proname+'/resources/images/more.png);']")
  @subscribe2.SCSY删除收阅_element.visibleClick
  @subscribe2.S是_element.visibleClick
  step 'tip提示内容 正在删除收阅记录'
  @subscribe2.wait_until { @subscribe2.text.include? '我的收阅' }
  @dr2.manage.timeouts.implicit_wait=5
  nums=@dr2.find_elements(:xpath => "//span[text()='#{$title}']").length
  if nums1<4
    expect(nums).to eql(nums1-1)
  end
end

And(/^登录另一用户(\d+)$/) do |user|
  @loginPage2=LoginPage.new(@dr2)
  @loginPage2.LoginWithPage '03504', user, '', @dr2
end

And(/^chk转发历史$/) do
  # @mySub.click
  @subscribe.Jzz加载中_element.when_not_visible(60)
  @dr.find_element(:xpath => "//td[text()='#{$title}']").click
  sleep 3
  # @subscribe.GD更多_element.visibleClick
  @dr.action_click(:xpath => "//span[@style='background-image: url(http://'+$ip+'/'+$proname+'/resources/images/more.png);']")
  @subscribe.ZFLS转发历史
  @subscribe.wait_until { @subscribe.text.include? "转发#{$title}" }
  step '返回'
end

And(/^讨论$/) do
  if @subscribe.TL讨论_element.exists?
    @subscribe.TL讨论
    step '选择人 902551 李和'
    @subscribe.SM订阅说明="讨论#{$title}"
    # @subscribe.span确定
    @dr.find_visible_element(:xpath => "//span[text()='确定']").click
  else
    @subscribe.HF回复
  end
  # @subscribe.TL讨论
  @subscribe.wait_until { @subscribe.text.include? "#{$title}" }
  @dr.manage.timeouts.implicit_wait=50
  @dr.find_element(:xpath => "//img[contains(@src,'http://218.108.50.4:8081/rest/UpLoadFiles/RW/')]").click
  @subscribe.wait_until { @dr.find_element(:xpath => "//td[text()='#{$title}']") }
  @dr.manage.timeouts.implicit_wait=20
  # @mySub.click
  # @dr.find_element(:xpath => "//td[text()='#{$title}']").click
  @subscribe.HF回复_element.visibleClick
  @subscribe.wait_until { @subscribe.text.include? "#{$title}" }
  @dr.find_element(:xpath => "//img[contains(@src,'http://218.108.50.4:8081/rest/UpLoadFiles/RW/')]").click


end

And(/^选择人 (\d+) (.*)$/) do |id, name|
  flag=@dr.check_element(:xpath => "//td[text()='#{name}(#{id})']")
  # user=@dr.find_element(:xpath => "//td[text()='#{name}(#{id})']")
  if flag
    sleep 1
    user=@dr.find_element(:xpath => "//td[text()='#{name}(#{id})']")
    user.click
    sleep 1
    # @subscribe.span确定
    @dr.find_visible_element(:xpath => "//span[text()='确定']").click
  else
    @subscribe.TJ添加
    @contractPage.txt搜索同事=name
    sleep 2
    @wait.until { @person=@dr.find_element(:xpath => "//div[text()='#{name}' and contains(@style,'margin-left:12px')]") }
    @person.click
    @contractPage.btn确定
  end
end

And(/^删除订阅$/) do
  @subscribe.GD更多_element.visibleClick
  @subscribe.SCSY删除收阅_element.visibleClick
  @subscribe.S是_element.visibleClick
  # step 'tip提示内容 正在删除收阅记录'
  @subscribe.wait_until { @subscribe.text.include? '我的订阅' }
  @dr.manage.timeouts.implicit_wait=5
  nums=@dr.find_elements(:xpath => "//td[text()='#{$title}']").length
  expect(nums).to eql(0)
end


And(/^进入选择报表界面$/) do
  @workPage.btn我的报表_element.visibleClick
  @subscribe.TJ添加_element.visibleClick
  @subscribe.wait_until { @subscribe.text.include? "选择报表" }
end

And(/^chk选择报表功能$/) do
  # 选定
  element=@dr.find_element(:xpath => "//*[text()='项目中标率_副本']")
  element.location_once_scrolled_into_view
  element.click
  sleep 1
  element=@dr.find_element(:xpath => "//*[text()='项目中标率_副本']/following-sibling::td/img[@style='width:32px;height:32px;']")
  sleep 1
  expect(element.attribute('src')).to include('/resources/images/btn_check_on_normal.png')
  # 全选
  @subscribe.QX全选
  sleep 1
  elements=@dr.find_elements(:xpath => "//img[@style='width:32px;height:32px;']")
  elements.each { |ele| expect(ele.attribute('src')).to include('/resources/images/btn_check_on_normal.png') }
  @subscribe.QBX全不选
  sleep 1
  elements=@dr.find_elements(:xpath => "//img[@style='width:32px;height:32px;']")
  elements.each { |ele| expect(ele.attribute('src')).to include('/resources/images/btn_check_off_normal.png') }
  #上拉显示
  num=elements.length
  @subscribe.SL上拉显示更多_element.scroll_into_view
  @subscribe.SL上拉显示更多
  sleep 1
  elements=@dr.find_elements(:xpath => "//img[@style='width:32px;height:32px;']")
  expect(elements.length).to be >num

  # 搜索
  @subscribe.SS搜索报表='项目中标率_副本'
  sleep 2
  @dr.manage.timeouts.implicit_wait=5
  @result_element=@dr.find_element(:xpath => "//td[text()='项目中标率_副本']")
  step '返回'
end


And(/^chk结果保存查看$/) do
  @subscribe.SX刷新
  @subscribe.wait_until(30, '') { @subscribe.text.include? "分公司合同总额合同收支汇总分析表" }
  @subscribe.GD更多
  @subscribe.JGBC结果保存_element.visibleClick
  # subject=__id__
  @subscribe.BC保存
  @subscribe.wait_until { @subscribe.text.include? "请输入主题" }
  @subscribe.span确定
  @subscribe.ZT主题='保存'+$title
  @subscribe.SM说明='保存'+$title
  @subscribe.BC保存
  # PageObject.javascript_framework =:prototype
  # PageObject.javascript_framework =:jquery
  # @subscribe.wait_for_ajax
  sleep 2
  element=@dr.find_element(:xpath => "//span[@style='background-image: url(http://'+$ip+'/'+$proname+'/resources/images/more.png);']")
  @dr.action.click(element).perform
  # @subscribe.GD更多_element.visibleClick
  @subscribe.JGCK结果查看_element.visibleClick
  @subscribe.wait_until { @subscribe.text.include? "#{$title}" }

end

And(/^我的订阅初始化$/) do
  t=Time.now
  $title='我的报表'+t.strftime("%_m月%d日%k时%M分")
  $flag=true
end