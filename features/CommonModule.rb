module CommonModule
  def LoginNetCall(user, psw, dr, enterprise='03504')
    @loginPage=LoginPage.new(@dr)
    @wait.until { @loginPage.enterprise }
    @loginPage.LoginWithPage enterprise, user, psw, dr
    @indexPage = IndexPage.new(@dr)
    @wait.until { @indexPage.btn设置_element.when_present }
  end

  def clk返回按钮(dr=@dr)
    dr.find_element(:xpath => "//span[text()='返回']").click
  end

  def clkButton(text, type='div')
    dr.find_element(:xpath => "//span[text()='返回']").click
  end

  # define_method :check_tip do |tip|
  #     @wait.until { @dr.find_element :xpath => "//div[contains(text(),#{tip})]" }
  # end

  class Object::Selenium::WebDriver::Element
    def visibleClick
      wait=Selenium::WebDriver::Wait.new(:timeout => 20)
      wait.until do
        self.displayed?
      end
      self.click
    end
  end

  # alias click old_click
  # class Object::Selenium::WebDriver::Element
  #   def click
  #     bridge.clickElement @id
  #   end
  # end
  # $m=Object::Selenium::WebDriver::Element.method(:click)
  class Object::Selenium::WebDriver::Element
    undef click

    def click
      bridge.clickElement @id
    end

    # alias_method :old_click, :click
    alias old_click click

    def click
      wait=Selenium::WebDriver::Wait.new(:timeout => 20)
      wait.until do
        self.displayed?
      end
      # self.send(Object::Selenium::WebDriver::Element.click)
      # $m.call
      self.old_click
    end
  end

  class Object::Selenium::WebDriver::Element
    def visibleClick
      wait=Selenium::WebDriver::Wait.new(:timeout => 20)
      wait.until do
        self.displayed?
      end
      self.click
    end

    def scroll_click
      self.location_once_scrolled_into_view
      self.visibleClick
    end
    # execute_script('window.scrollTo(0, ' + str(element.location['y']) + ');'
    #scroll to myelement
    # @browser.execute_script "window.scrollTo(#{myelement.element.wd.location[0]},#{myelement.element.wd.location[1]})"

    # click myelement
    #     myelement.when_present.fire_event("click")
  end

  module PageObject::Platforms::SeleniumWebDriver::Element
    def visibleClick
      wait=Selenium::WebDriver::Wait.new(:timeout => 20)
      wait.until do
        self.visible?
      end
      self.click
    end

    def scroll_click
      self.scroll_into_view
      self.visibleClick
    end

    # def action_click
    #   @dr.action.click(self).perform
    #   # bridge.action.click(self).perform
    # end
  end

  # module PageObject::Platforms::SeleniumWebDriver::Element
  #   def performClick(dr)
  #     wait=Selenium::WebDriver::Wait.new(:timeout => 20)
  #     wait.until do
  #       self.visible?
  #     end
  #     dr.action.click(self).perform
  #   end
  # end

  class Selenium::WebDriver::Driver
    # def get_visible_element(dr,selector)
    #   elements=dr.find_elements(selector)
    #   elements2=elements.each { |ele| ele.displayed? }
    #   # elements2[0].click
    #   elements2[0]
    # end
    def find_visible_element(selector)
      elements=self.find_elements(selector)
      elements2=elements.select { |ele| ele.displayed? }
      # elements2[0].click
      elements2[0]
    end

    def check_element(selector, time=5)
      begin
        self.manage.timeouts.implicit_wait =time
        self.find_element(selector)
      rescue Selenium::WebDriver::Error::NoSuchElementError => e
        return false
      end
      true
    end

    def action_click(selector)
      element=self.find_element(selector)
      self.action.click(element).perform
    end

    def switch_other_window
      myHandle=self.window_handle
      myHandles=self.window_handles
      myHandles.each do |handle|
        if handle!=myHandles
          self.switch_to.window handle
        end
      end
    end
  end

end