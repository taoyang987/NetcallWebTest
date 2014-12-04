Feature: 通用


  Scenario: 退出按钮
    Given 导航到通用页面
    When 点击 退出账号 DIV按钮
    When 点击 是 按钮
    Then 跳转到了登录页面
    Then ch登录界面记忆账号信息


  @关于
  Scenario: 关于-返回按钮
    Given 导航到通用页面
    When 点击 关于 DIV按钮
    And 点击 返回 按钮
    Then 返回到了通用设置页面

  @关于
  Scenario: 功能介绍
    Given 导航到通用页面
    When 点击 关于 DIV按钮
    Then 校验功能介绍

  @关于
  Scenario: 校验帮助与反馈
    Given 导航到通用页面
    When 点击 关于 DIV按钮
    Then 校验帮助与反馈
#    Then 校验意见反馈

  @关于
  Scenario: 检查新版本
    Given 导航到通用页面
    When 点击 关于 DIV按钮
    Then 校验检查新版本

  @关于
  Scenario: 校验条款
    Given 导航到通用页面
    When 点击 关于 DIV按钮
    Then 校验条款

  @消息设置
  Scenario: 返回按钮
    Given  导航到消息设置页面
    When 点击 返回 按钮
    Then 返回到了通用设置页面

  @消息设置
  Scenario: 接受新消息通知
    Given  导航到消息设置页面
    When 校验接受新消息通知按钮

  @消息设置
  Scenario: 通知不显示消息详情
    Given  导航到消息设置页面
    When 校验通知不显示消息详情按钮

  @消息设置
  Scenario: 不接收业务消息
    Given  导航到消息设置页面
    When 校验不接收业务消息按钮

  @消息设置
  Scenario: 回车键发送消息
    Given  导航到消息设置页面
    When 校验回车键发送消息按钮

  @消息设置
  Scenario: 声音
    Given  导航到消息设置页面
    When 校验声音按钮

  @消息设置
  Scenario: 震动
    Given  导航到消息设置页面
    When 校验震动按钮

  @聊天背景
  Scenario: 返回按钮
    Given 导航到聊天背景设置页面
    When 点击 返回 按钮
    Then 返回到了通用设置页面

  @聊天背景
  Scenario: 从相册中选择
    Given 导航到聊天背景设置页面
    When 检验 从相册中选择 按钮


  @聊天背景
  Scenario: 从相册中选择
    Given 导航到聊天背景设置页面
    When 检验 拍一张 按钮

  @聊天背景
  Scenario: 从相册中选择
    Given 导航到聊天背景设置页面
    When 检验 清空背景 按钮