require 'page-object'
require_relative 'work_basic'
class NewsPage<WorkBasic
  include PageObject
  attr_accessor :btn所有新闻
  button(:btn所有新闻, :xpath => "//div[text()='所有新闻']")
  attr_accessor :btn未阅新闻
  button(:btn未阅新闻, :xpath => "//div[text()='未阅新闻']")
  attr_accessor :btn所有新闻
  button(:btn所有新闻, :xpath => "//div[text()='所有新闻']")
  attr_accessor :btn新中大新闻
  button(:btn新中大新闻, :xpath => "//div[text()='新中大新闻']")
  attr_accessor :btn重要新闻
  button(:btn重要新闻, :xpath => "//div[text()='重要新闻']")
  attr_accessor :btn一般新闻
  button(:btn一般新闻, :xpath => "//div[text()='一般新闻']")
  attr_accessor :btn更多类型
  button(:btn更多类型, :xpath => "//div[text()='更多类型…']")
  attr_accessor :btn类型中的新中大新闻
  button(:btn类型中的新中大新闻, :xpath => "//div[text()='新中大新闻' and contains(@style,'font-size:1.1em;')]")


  attr_accessor :btn当前类别
  button(:btn当前类别, :xpath => "//div[@class='x-container x-layout-box-item x-stretched']/div[@class='x-inner']/div[@class='x-innerhtml' and text()!='']")


  #$x("//div[@class='x-container x-sized' and contains(@style,'background-image')]")
  attr_accessor :btn标题
  button(:btn标题, :xpath => "//div[@style='width: 80%;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;']")
  attr_accessor :btn画布
  button(:btn画布, :xpath => "//div[@class='x-carousel-item x-sized' and @style='-webkit-transform: translate3d(0px, 0px, 0px);']/div[@class='x-container x-sized']")

  attr_accessor :btn附件
  button(:btn附件, :xpath => '//div[@style="width:28px;height: 28px;background-repeat: no-repeat;background-image:url(\'resources/images/work/attach.png\');background-size: contain;position: relative;"]')

end