Feature: 申请账号

  Scenario: 返回按钮
    Given 导航到申请账号界面
    When 点击返回按钮
    Then 返回到了登录页面

  Scenario: 正常申请
    Given 导航到申请账号界面
    When 输入申请账号信息:
      | Enterprise | User  | Password |
      | 03504      | 10079 | 123456   |
    Then 提示设备已授权成功

  Scenario: 企业号错误
    Given 导航到申请账号界面
    When 输入申请账号信息:
      | Enterprise | User  | Password |
      | 03599      | 10079 | 123456   |
    Then 申请提示 企业号无效

  Scenario: 企业号中英文字符
    Given 导航到申请账号界面
    When 输入申请账号信息:
      | Enterprise | User  | Password |
      | 035abc企业号  | 10079 | 123456   |
    Then 申请提示 企业号无效

  Scenario: 企业号未填写
    Given 导航到申请账号界面
    When 输入申请账号信息:
      | Enterprise | User  | Password |
      |            | 10079 | 123456   |
    Then 申请提示 企业号无效

  Scenario: 未输入企业号和用户名
    Given 导航到申请账号界面
    When 输入申请账号信息:
      | Enterprise | User | Password |
      |            |      | 123456   |
    Then 申请提示 请输入企业号
    And 申请提示 请输入用户名

  Scenario: 未输入企业号，已输入用户名
    Given 导航到申请账号界面
    When 输入申请账号信息:
      | Enterprise | User  | Password |
      |            | 10079 | 123456   |
    Then 申请提示 请输入企业号

  Scenario: 未输入用户名
    Given 导航到申请账号界面
    When 输入申请账号信息:
      | Enterprise | User | Password |
      | 03504      |      | 123456   |
    Then 申请提示 请输入用户名

  Scenario: 未输入密码
    Given 导航到申请账号界面
    When 输入申请账号信息:
      | Enterprise | User  | Password |
      | 03504      | 10079 |          |
    Then 提示设备已授权成功