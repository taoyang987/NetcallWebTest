require 'page-object'
class MySubscribePage
  include PageObject
  # 我的订阅
  attr_accessor :KSSJ开始时间
  button(:KSSJ开始时间, :name => 'begintime')
  attr_accessor :JSSJ结束时间
  button(:JSSJ结束时间, :name => 'endtime')

  attr_accessor :QX取消
  button(:QX取消, :xpath => "//span[text()='取消']")
  attr_accessor :QD确定
  button(:QD确定, :xpath => "//span[text()='确定']")

  attr_accessor :SM订阅说明
  text_area(:SM订阅说明, :name => "rptsubscribeRemark")


  #我的收阅
  attr_accessor :ZDH最大
  button(:ZDH最大, :xpath => "//div[@style='width: 32px !important; height: 32px !important; bottom: 5px !important; z-index: 4 !important; background-image: url(http://'+$ip+'/'+$proname+'/resources/images/ierw.png);']")
  attr_accessor :ZF转发
  button(:ZF转发, :xpath => "//span[text()='转发']")
  attr_accessor :TL讨论
  button(:TL讨论, :xpath => "//span[text()='讨论']")
  attr_accessor :QH切换
  button(:QH切换, :xpath => "//div[text()='切换']")
  attr_accessor :HF回复
  button(:HF回复, :xpath => "//span[text()='回复']")
  attr_accessor :SX刷新
  button(:SX刷新, :xpath => "//span[text()='刷新']")


  attr_accessor :FGS分公司合同总额
  button(:FGS分公司合同总额, :xpath => "//span[text()='分公司合同总额']")
  attr_accessor :TB图表
  button(:TB图表, :xpath => "//span[text()='图表']")
  attr_accessor :XJKB新建空白
  button(:XJKB新建空白, :xpath => "//span[text()='新建空白']")

  attr_accessor :XZ向左
  button(:XZ向左, :xpath => "//span[@class='x-button-icon x-shown arrow_left']")
  attr_accessor :XY向右
  button(:XY向右, :xpath => "//span[@class='x-button-icon x-shown arrow_right']")

  attr_accessor :SY所有
  button(:SY所有, :xpath => "//span[text()='所有']")
  attr_accessor :BG表格
  button(:BG表格, :xpath => "//span[text()='表格']")
  attr_accessor :TX图形
  button(:TX图形, :xpath => "//span[text()='图形']")

  attr_accessor :FGS分公司合同总额分析表五月
  button(:FGS分公司合同总额分析表五月, :xpath => "//td[text()='分公司合同总额分析表五月']")
  attr_accessor :TJ添加
  button(:TJ添加, :xpath => "//div[@id='addlistbtn']/span[@class='x-button-icon x-shown add']")


  attr_accessor :TS提示
  button(:TS提示, :xpath => "//div[text()='提示']")
  attr_accessor :DQW当前为第一页
  button(:DQW当前为第一页, :xpath => "//div[text()='当前为第一页']")
  attr_accessor :DQW当前为最后一页
  button(:DQW当前为最后一页, :xpath => "//div[text()='当前为最后一页']")
  attr_accessor :QD确定
  button(:QD确定, :xpath => "//div[text()='确定']")

  attr_accessor :GD更多
  button(:GD更多, :xpath => "//span[contains(@style,'/resources/images/more.png);')]")
  # button(:GD更多, :xpath => "//span[@style='background-image: url(http://'+$ip+'/'+$proname+'/resources/images/more.png);']")
  attr_accessor :ZFLS转发历史
  button(:ZFLS转发历史, :xpath => "//span[text()='转发历史']")
  attr_accessor :SCSY删除收阅
  button(:SCSY删除收阅, :xpath => "//span[contains(text(),'删除')]")
  attr_accessor :ZDH最大化
  button(:ZDH最大化, :xpath => "//span[text()='最大化']")

  attr_accessor :JGBC结果保存
  button(:JGBC结果保存, :xpath => "//span[text()='结果保存']")
  attr_accessor :JGCK结果查看
  button(:JGCK结果查看, :xpath => "//span[text()='结果查看']")

  attr_accessor :HK李和
  button(:HK李和, :xpath => "//td[text()='李和(902551)']")
  attr_accessor :span确定
  button(:span确定, :xpath => "//span[text()='确定']")

  attr_accessor :ZT主题
  text_field(:ZT主题, :name => "topic")

  attr_accessor :ZT报表主题
  text_field(:ZT报表主题, :name => "topicQ")

  attr_accessor :SM说明
  text_field(:SM说明, :name => "information")
  attr_accessor :SM报表说明
  text_field(:SM报表说明, :name => "informationQ")
  attr_accessor :QX取消
  button(:QX取消, :xpath => "//span[text()='取消']")
  attr_accessor :BC保存
  button(:BC保存, :xpath => "//span[text()='保存']")

  attr_accessor :SL上拉显示更多
  button(:SL上拉显示更多, :xpath => "//div[text()='上拉显示更多...']")
  attr_accessor :SS搜索报表
  text_field(:SS搜索报表, :xpath => "//input[@placeholder='搜索报表']")

  attr_accessor :S是
  button(:S是, :xpath => "//span[text()='是']")

  attr_accessor :QBX全不选
  button(:QBX全不选, :xpath => "//span[text()='全不选']")
  attr_accessor :QX全选
  button(:QX全选, :xpath => "//span[text()='全选']")

  attr_accessor :SL上拉显示更多
  button(:SL上拉显示更多, :xpath => "//div[text()='上拉显示更多...']")

  attr_accessor :Jzz加载中
  button(:Jzz加载中, :xpath => "//div[contains(text(),'加载中')]")

end