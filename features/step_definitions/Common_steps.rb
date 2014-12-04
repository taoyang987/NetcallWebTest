And(/^clk (.*) div按钮$/) do |button|
  @dr.find_element(:xpath => "//div[text()='#{button}']").click
end

And(/^clk (.*) span按钮$/) do |button|
  # btn=@dr.find_element(:xpath=>"//div[contains(text(), '#{button}')]")
  # @wait.until{btn.displayed?}
  # sleep 2
  # btn.click
  @dr.find_element(:xpath => "//span[text()='#{button}']").click
end

And(/^clk (.*) contain div按钮$/) do |button|
  # btn=@dr.find_element(:xpath=>"//div[contains(text(), '#{button}')]")
  # @wait.until{btn.displayed?}
  # sleep 2
  # btn.click
  @dr.find_element(:xpath => "//div[contains(text(), '#{button}')]").click
end

And(/^clk (.*) contain span按钮$/) do |button|
  # btn=@dr.find_element(:xpath=>"//div[contains(text(), '#{button}')]")
  # @wait.until{btn.displayed?}
  # sleep 2
  # btn.click
  @dr.find_element(:xpath => "//div[contains(text(), '#{button}')]").click
end

And(/^clk (.*) contain 按钮$/) do |button|
  # btn=@dr.find_element(:xpath=>"//div[contains(text(), '#{button}')]")
  # @wait.until{btn.displayed?}
  # sleep 2
  # btn.click
  @dr.find_element(:xpath => "//span[contains(text(), '#{button}')]").click
end

Then(/^tip提示内容 (.*)$/) do |tip|
  @wait.until { @dr.find_element :xpath => "//div[contains(text(),#{tip})]" }
end

Then(/^check_tip (.*)$/) do |tip|
  @wait.until { @dr.find_element :xpath => "//div[contains(text(),#{tip})]" }
end

Given(/^LoginAs (\d+) (.*)$/) do |user, psw|
  step '导航到登录界面'
  @loginPage=LoginPage.new(@dr)
  @loginPage.LoginWithPage '03504', user, psw, @dr
  @indexPage = IndexPage.new(@dr)
  @wait.until { @indexPage.btn设置_element.when_present }
end


And(/^返回$/) do
  # btn=@dr.find_element(:xpath=>"//div[contains(text(), '#{button}')]")
  # @wait.until{btn.displayed?}
  # sleep 2
  # btn.click
  elements=@dr.find_elements(:xpath => "//span[text()='返回']")
  elements2=elements.select { |ele| ele.displayed? }
  # elements2[0].click
  @dr.action.click(elements2[0]).perform
end