Feature: 新闻公告
  #标题格式:taoy2014070015 附件:.doc 评语:同意!
  Background: 初始变量
    Given 初始变量

  @GongGaoLiuChen @i6p
  Scenario: 公告流程
    Given 新建公告流程
    When 登录902231账号
    And chk消息界面审批任务通知
    And chk消息界面及工作界面进入
    And chk审批任务界面功能
    And 转签给902551
    #902551 李和
    And 登录902551
    And 审核通过
    And 校验任务详细及流转历史
    And chk新闻公告
    And chk未阅新闻
    And chk已阅新闻
    And chk新中大新闻
    And chk更多类型新闻
    And chk新闻公告内容

#   Scenario: 校验流程
#     Given 配置校验数据
#     And 校验任务详细及流转历史
#     And chk新闻公告
#     And chk未阅新闻
#     And chk已阅新闻
#     And chk新中大新闻
#    And chk更多类型新闻
#    And chk新闻公告内容

  @BoHui @i6p
  Scenario: 公告流程-驳回
    Given 新建公告流程
    When 登录902231账号
    And chk消息界面审批任务通知
    And chk消息界面及工作界面进入
    And 审核驳回

  @GongWenShouYue @i6p
  Scenario: 公文收阅
    Given 新建发文流程
    When 登录902231账号
    And chk消息界面公文收阅通知
    And chk公文收阅消息界面及工作界面进入
    And chk未阅公文
    And chk公文内容
    And chk公文已阅
    And chk公文类别
    And chk公文搜索

#  Scenario:公文校验流程
#    Given 公文配置校验数据
#    When 登录902231账号
#    And 重新进入公文收阅列表
##    And chk未阅公文
##    And chk公文内容
#    And chk公文已阅
#    And chk公文类别
#    And chk公文搜索