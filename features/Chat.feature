Feature: 好友交流

  Scenario:好友资料界面返回按钮
    Given 导航到顾光雄详细资料界面
    When 点击 返回 按钮
    Then 跳转到了通讯录界面

  Scenario:打电话
    Given 导航到顾光雄详细资料界面
    #以李庭忠903496登录
    When 点击通话按钮
    Then 校验通话功能

  Scenario: 发短信
    Given 导航到顾光雄详细资料界面
    When 点击短信按钮
    Then 校验短信功能

  Scenario:好友聊天界面返回按钮
    Given 进入到与顾光雄聊天界面
    When 点击 返回 按钮
    Then 跳转到了消息界面

  @chat
  Scenario: 文本聊天
    Given 进入到与顾光雄聊天界面
    When 发送文本消息 与你聊天
    Then 登录顾光雄的账号903507检验

  @chat
  Scenario: 文本聊天 bug 88486
    Given 进入到与顾光雄聊天界面
    When 发送文本消息 与你聊天
    Then 登录顾光雄的账号903507检验
    Then 检验消息数量标志消失

  @chat
  Scenario: 文本聊天
    Given 进入到与顾光雄聊天界面
    When 发送文本消息 与你聊天dsfsdf
    Then 登录顾光雄的账号903507检验

  @chat
  Scenario: 表情聊天
    Given 进入到与顾光雄聊天界面
    When 发送表情
    #默认为 [打脸]
    Then 登录顾光雄的账号903507检验

  @chat
  Scenario: 文本表情聊天
    Given 进入到与顾光雄聊天界面
    When 发送文本消息混合表情
    Then 登录顾光雄的账号903507检验

  @chat
  Scenario: 图片聊天
    Given 进入到与顾光雄聊天界面
    When 发送图片消息

  @chat
  Scenario: 拍照聊天
    Given 进入到与顾光雄聊天界面
    When 拍照并发送该图片

  @chat
  Scenario: 语音聊天
    Given 进入到与顾光雄聊天界面
    When 发送语音消息

  @chat @groupchat
  Scenario: 群聊-文本聊天
    Given 进入到聊天群 75975
    When 发送文本消息 与你群聊
    Then 登录顾光雄的账号903507检验群聊信息

  @chat @groupchat
  Scenario: 群聊-表情聊天
    Given 进入到聊天群 75975
    When 发送表情
    #默认为 [打脸]
    Then 登录顾光雄的账号903507检验群聊信息

  @chat @groupchat
  Scenario: 群聊-文本表情聊天
    Given 进入到聊天群 75975
    When 发送文本消息混合表情
    Then 登录顾光雄的账号903507检验群聊信息

  @chat @groupchat
  Scenario: 群聊-图片聊天
    Given 进入到聊天群 75975
    When 发送图片消息

  @chat @groupchat
  Scenario: 群聊-拍照聊天
    Given 进入到聊天群 75975
    When 拍照并发送该图片

  @chat @groupchat
  Scenario: 群聊-语音聊天
    Given 进入到聊天群 75975
    When 发送语音消息
