Feature: 登录

  Scenario: 有密码的账号正常登录
    Given 导航到登录界面
    When 输入企业号 03504
    And 输入账号 903478
    And 输入密码 123456
    And 点击登录
    Then 登录到首页

  Scenario: 无密码的账号正常登录
    Given 导航到登录界面
    When 输入企业号 03504
    And 输入账号 902551
    And 点击登录
    Then 登录到首页

  Scenario: 企业号错误
    Given 导航到登录界面
    When  输入企业号 03508
    And 输入账号 902231
    And 点击登录
    Then 提示内容 企业号无效

  Scenario: 企业号错误-中英文混合
    Given 导航到登录界面
    When  输入企业号 035abc企业号
    And 输入账号 902231
    And 点击登录
    Then 提示内容 企业号无效

  Scenario: 用户名错误
    Given 导航到登录界面
    When 输入企业号 03504
    And 输入账号 90223143
    And 输入密码 123456
    And 点击登录
    Then 提示内容 用户名或密码错误

  Scenario: 密码错误
    Given 导航到登录界面
    When 输入企业号 03504
    And 输入账号 902231
    And 输入密码 123456
    And 点击登录
    Then 提示内容 用户名或密码错误

  Scenario: 未输入企业号和用户名
    Given 导航到登录界面
    When 点击登录
    Then 提示内容 请输入企业号
    And 提示内容 请输入用户名

  Scenario: 未输入企业号，已输入用户名
    Given 导航到登录界面
    When 输入账号 902231
    And 点击登录
    Then 提示内容 请输入企业号

  Scenario: 未输入用户名
    Given 导航到登录界面
    When 输入企业号 03504
    When 点击登录
    Then 提示内容 请输入用户名

  Scenario: 未输入密码
    Given 导航到登录界面
    When 输入企业号 03504
    And 输入账号 902231
    And 输入密码 1234123
    And 点击登录
    Then 提示内容 用户名或密码错误

  Scenario: 企业号对应删除按钮
    Given 导航到登录界面
    When 输入企业号 11111
    And 点击删除按钮
    Then 校验结果为空

  Scenario: 用户名对应删除按钮
    Given 导航到登录界面
    When 输入账号 11111
    And 点击删除按钮
    Then 校验结果为空

  Scenario: 密码对应删除按钮
    Given 导航到登录界面
    When 输入密码 11111
    And 点击删除按钮
    Then 校验结果为空

