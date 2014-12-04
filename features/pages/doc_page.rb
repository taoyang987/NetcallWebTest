require 'page-object'
require_relative 'work_basic'
class DocPage <WorkBasic
  include PageObject
  attr_accessor :btn阅公文
  button(:btn阅公文, :xpath => "//div[@class='x-inner']/div[@class='x-innerhtml' and contains(text(), '公文')]")
  attr_accessor :btn未阅公文
  button(:btn未阅公文, :xpath => "//div[@class='type-list-item']/div[text()='未阅公文']")
  attr_accessor :btn全部公文
  button(:btn全部公文, :xpath => "//div[text()='全部公文']")
  attr_accessor :btn天宫檄文
  button(:btn天宫檄文, :xpath => "//div[@class='type-list-item']/div[text()='天宫檄文']")
  attr_accessor :btn行政发文
  button(:btn行政发文, :xpath => "//div[@class='type-list-item']/div[text()='行政发文']")
  # attr_accessor :btn搜索 #父类中定义了
  # button(:btn搜索, :xpath => "//div[@style='width: 23px !important; height: 23px !important; margin: 16px !important; background-image: url(http://'+$ip+'/'+$proname+'/resources/images/work/search.png);']")
  attr_accessor :txt搜索
  text_field(:txt搜索, :xpath => "//input[@placeholder='在全部公文中搜索']")

  attr_accessor :btn附件
  button(:btn附件, :xpath => "//span[text()='附件']")
  attr_accessor :btn正文
  button(:btn正文, :xpath => "//span[text()='正文']")

end