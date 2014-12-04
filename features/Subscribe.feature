Feature: 报表

  Background: 初始变量
    Given 报表变量初始化

  @second @BaoBiao @i6p
  Scenario: 报表订阅
    Given 新建报表订阅
    When 登录902231账号
    And 进入到报表界面
    And chk我的订阅收到
    And chk订阅时间查询
#    And chk最大化
    And chk订阅报表
    And 转发给 902551 李和
    And 登录另一用户902551
    And chk转发结果
    And chk删除收阅
    And chk转发历史
    And 讨论
    And 删除订阅

  @second
  Scenario: 我的订阅
    Given 登录902231账号
    And 我的订阅初始化
    When 进入到报表界面
    And 进入选择报表界面
    And chk选择报表功能
    And chk最大化
    And chk订阅报表
    And 转发给 902551 李和
    And 登录另一用户902551
    And chk转发结果
    And chk结果保存查看

