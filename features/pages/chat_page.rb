require 'page-object'
class ChatPage
  attr_accessor :btn语音, :btn发送图片, :txt消息框, :btn表情, :btn图片, :btn拍照, :btn发送, :btn电话, :btn短信
  include PageObject
  button(:btn电话, :id => 'tel')
  button(:btn短信, :id => 'sms')
  # button(:btn发消息,:xpath=>"//span[text()='发消息']")
  attr_accessor :btn发消息
  div(:btn发消息, :xpath => "//span[text()='发消息']")
  #对话界面
  button(:btn语音, :id => 'speechOrTextBtn')
  button(:btn发送图片, :css => 'span.x-button-icon.x-shown.add.gray')
  text_area(:txt消息框, :name => 'sendtext')
  button(:btn表情, :id => 'selectFace')
  button(:btn图片, :id => 'selectPic')
  button(:btn拍照, :id => 'takePictures')
  button(:btn发送, :xpath => "//span[text()='发送']")
  attr_accessor :img表情
  button(:img表情, :xpath => "//div[contains(@style, '/resources/images/newgrandFace/dalian.png);')]")
  attr_accessor :imgFace
  div(:imgFace, :css => "img[src='resources/images/newgrandFace/dalian.png']")
  attr_accessor :btn群名称
  button(:btn群名称, :xpath => "//div[@class='x-unsized x-title x-floating' and @style='padding-top: 0px; z-index: 8 !important;']/div[text()!='我的设置']")
end