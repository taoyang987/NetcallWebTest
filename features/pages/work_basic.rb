require 'page-object'
class WorkBasic
  include PageObject
  attr_accessor :btn搜索
  button(:btn搜索, :xpath => "//div[@class='x-img x-img-image x-img-background x-sized x-paint-monitored x-size-monitored']")

end