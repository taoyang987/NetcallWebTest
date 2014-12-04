Feature: 通讯录

  Scenario: 搜索联系人-名字
    Given 导航到通讯录页面
    When 搜索联系人 顾光雄
    Then 只出现 顾光雄 一个人

  Scenario: 搜索联系人-部分名字前面
    Given 导航到通讯录页面
    When 搜索联系人 顾
    Then 只出现 顾光雄 一个人

  Scenario: 搜索联系人-部分名字后面
    Given 导航到通讯录页面
    When 搜索联系人 光雄
    Then 只出现 顾光雄 一个人

  Scenario: 搜索联系人-nc号
    Given 导航到通讯录页面
    When 搜索联系人 903507
    Then 只出现 顾光雄 一个人

  Scenario: 搜索联系人-删除按钮
    Given 导航到通讯录页面
    When 搜索联系人 顾光雄
#    Then 组织结构按钮消失
    When 点击删除按钮
    Then 组织结构按钮出现

  Scenario: 名字开头字母中转
    Given 导航到通讯录页面
    When 点击字母按钮L
    Then 跳转到L开头名单

  Scenario: 添加同事-取消
    Given 导航到通讯录页面
    When 点击添加同事
    And 点击 取消 按钮
    Then 跳转到了通讯录界面

  Scenario: 添加同事-返回
    Given 导航到通讯录页面
    When 点击添加同事
    And 点击 返回 按钮
    Then 跳转到了根目录组织界面

  Scenario: 删除同事-同部门不允许删除
    Given 导航到通讯录页面
    When 简单删除同事 曾燕
    Then 提示内容 同个部门的同事不允许删除

  @添加好友
  Scenario: 添加朋友-搜索名字
    Given 导航到通讯录页面
    When 删除同事 刘文忠
    And 点击添加同事
    And 搜索同事并添加 刘文忠
    And 登录刘文忠通过验证
    Then  出现在好友列表中 刘文忠
#刘文忠 中国水利水电第九工程局有限公司-水电九局五分局-水电九局五分局综合办公室

  @添加好友
  Scenario: 添加朋友-搜索名字bug 88482
    Given 导航到通讯录页面
    When 删除同事 刘文忠
    And 点击添加同事
    And 搜索同事并添加 刘文忠
    And 登录刘文忠通过验证
    Then  出现在好友列表中 刘文忠
    Then 注销
    Given 导航到通讯录页面
    Then  出现在好友列表中 刘文忠


    #BUG 80470
  @添加好友
  Scenario: 添加朋友-搜索netcall号
    Given 导航到通讯录页面
    When 删除同事 刘文忠
    And 点击添加同事
    And 进入组织目录 中国水利水电第九工程局有限公司-水电九局五分局
    And 搜索同事netcall号并添加 902231,刘文忠
    And 登录刘文忠通过验证
    Then  出现在好友列表中 刘文忠



  @添加好友
  Scenario: 添加朋友-拒绝
    Given 导航到通讯录页面
    When 删除同事 刘文忠
    And 点击添加同事
    And 搜索同事并添加 刘文忠
    And 登录刘文忠并拒绝
    Then 好友列表中不存在 刘文忠

  Scenario: 添加同事-不能超过50人
    Given 导航到通讯录页面
    When 点击添加同事
    And 全选根目录组织
    Then 提示内容 总人数超过50人

  @添加好友
  Scenario: 添加朋友-导航到目录添加
    Given 导航到通讯录页面
    When 点击添加同事
    And 进入组织目录 中国水利水电第九工程局有限公司-水电九局五分局
    And 选择组织结构目录树 水电九局五分局综合办公室
    Then 验证结点已选择

