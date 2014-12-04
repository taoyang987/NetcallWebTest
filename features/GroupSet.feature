Feature: 群设置

  Scenario: 修改群名称
    Given 导航到75975群的设置页面
    When 修改群名称为 75975测试群
    Then 校验群名称

  Scenario: 修改群名称-中英数混合
    Given 导航到75975群的设置页面
    When 修改群名称为 group75975测试群
    Then 校验群名称

  Scenario: 修改群名称-删除
    Given 导航到75975群的设置页面
    When 导航到群名称修改页面
    When 删除群名称
    Then 群名称不能为空

  Scenario: 修改群名称-取消按钮
    Given 导航到75975群的设置页面
    When 导航到群名称修改页面
    When 点击 取消 按钮
    Then 跳转到了群设置页面

  Scenario Outline: : 修改群公告
    Given 导航到75975群的设置页面
    When 修改群公告为 <公告内容>
    Then 校验群公告

  Examples:
    | 公告内容                                               |
    | 75975测试群的公告123                                     |
    | 字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字 |
    #50个字

  Scenario: 修改群公告-删除
    Given 导航到75975群的设置页面
    When 导航到群公告修改页面
    When 删除群公告
    Then 校验群公告

  Scenario: 修改群公告-取消按钮
    Given 导航到75975群的设置页面
    When 导航到群公告修改页面
    When 点击 取消 按钮
    Then 跳转到了群设置页面

  Scenario: 清楚聊天记录
    Given 导航到75975群的设置页面
    When 点击 清空聊天记录 DIV按钮
    Then 校验清空聊天记录效果

    @newgroup
  Scenario: 创建群
    Given 导航到创建群界面
    When 选择固定群友创建
    Then 校验群

  @second @newgroup
  Scenario: 创建群并聊天 bug 88163
    Given 导航到创建群界面
    When 选择固定群友创建
    And 以田敏904243登录群
#    Then 校验群
    When 发送文本消息 与你群聊
    Then 登录田敏的账号904243检验群聊信息

  @newgroup
  Scenario: 邀请新成员
    Given 导航到创建群界面
    When  选择固定群友创建
    And 邀请 李和 加入群
    Then 校验 李和 在群成员中

  Scenario: 解散群
    Given 导航到创建群界面
    When  选择固定群友创建
    And 解散群
    Then 校验群已解散

#    #删除默认创建的群
#  Scenario: 解散群2
#    Given 导航到李庭忠,陈兴友,田敏群的设置页面
#    And 执行解散群

  @second @newgroup
  Scenario: 退出群
    Given 导航到创建群界面
    When  选择固定群友创建
    And 以田敏904243登录群
    And 退出群
    Then 校验群已退出

  Scenario: 修改群公告-群成员非法
    Given 田敏904243导航到75975群的设置页面
    When 导航到群公告修改页面
    Then chk群公告无效修改

  Scenario: 邀请新成员-群成员非法
    Given 田敏904243导航到75975群的设置页面
    When  点击 邀请新成员 DIV按钮
    Then 提示内容 没有邀请新成员的权限

  Scenario: 修改群名称-群成员非法
    Given 田敏904243导航到75975群的设置页面
    When goto群名称修改界面
    Then chk群名称无法修改



