Feature:个人信息

  @avatar
  Scenario:头像修改-从相册中选择
    Given 导航到个人信息页面
    When 点击修改头像按钮
    And 点击 从相册中选择 按钮
    Then 选择对话框消失

  @avatar
  Scenario:头像修改-拍一张
    Given 导航到个人信息页面
    When 点击修改头像按钮
    And 点击 拍一张 按钮
    Then 选择对话框消失

  @avatar
  Scenario:头像修改-取消
    Given 导航到个人信息页面
    When 点击修改头像按钮
    And 点击 取消 按钮
    Then 选择对话框消失

  @nick
  Scenario: 修改昵称-返回按钮
    Given 导航到个人信息页面
    When 点击昵称按钮
    And 点击 返回 按钮
    Then 返回到了个人信息页面

  @nick
  Scenario: 修改昵称-删除按钮
    Given 导航到个人信息页面
    When 点击昵称按钮
    And 删除信息
    Then 校验昵称信息

  @nick
  Scenario: 修改昵称-中英文混合
    Given 导航到个人信息页面
    When 点击昵称按钮
    And 输入信息 abc123李和
    Then 校验昵称信息
#
  @phone
  Scenario: 修改联系电话-返回按钮
    Given 导航到个人信息页面
    When 点击 联系电话 DIV按钮
    And 点击 返回 按钮
    Then 返回到了个人信息页面

  @phone
  Scenario: 修改联系电话-删除按钮
    Given 导航到个人信息页面
    When 点击 联系电话 DIV按钮
    And 删除信息
    Then 提示内容 手机号码错误

  @phone
  Scenario: 修改联系电话-固定电话
    Given 导航到个人信息页面
    When 点击 联系电话 DIV按钮
    And 输入信息 98982520
    Then 提示内容 手机号码错误

  @phone
  Scenario: 修改联系电话-固定电话-全
    Given 导航到个人信息页面
    When 点击 联系电话 DIV按钮
    And 输入信息 0571-98982520
    Then 提示内容 手机号码错误

  @phone
  Scenario: 修改联系电话-手机号
    Given 导航到个人信息页面
    When 点击 联系电话 DIV按钮
    And 输入信息 13789525215
    Then 校验电话号码

  @phone
  Scenario: 修改联系电话-手机号-全
    Given 导航到个人信息页面
    When 点击 联系电话 DIV按钮
    And 输入信息 +8613789525215
    Then 校验电话号码

  @phone
  Scenario: 修改联系电话-中英文混合
    Given 导航到个人信息页面
    When 点击 联系电话 DIV按钮
    And 输入信息 abc123电话号码
    Then 提示内容 手机号码错误
#
  @company
  Scenario: 修改注册单位-返回按钮
    Given 导航到个人信息页面
    When 点击 注册单位 DIV按钮
    And 点击 返回 按钮
    Then 返回到了个人信息页面

  @company
  Scenario: 修改注册单位-删除按钮
    Given 导航到个人信息页面
    When 点击 注册单位 DIV按钮
    And 删除信息
    Then 校验注册单位信息

  @company
  Scenario: 修改注册单位-中英文混合
    Given 导航到个人信息页面
    When 点击 注册单位 DIV按钮
    And 输入信息 abc123注册单位信息
    Then 校验注册单位信息
#
  @email
  Scenario: 修改电子邮箱-返回按钮
    Given 导航到个人信息页面
    When 点击 电子邮箱 DIV按钮
    And 点击 返回 按钮
    Then 返回到了个人信息页面

  @email
  Scenario: 修改电子邮箱-删除按钮
    Given 导航到个人信息页面
    When 点击 电子邮箱 DIV按钮
    And 删除信息
    Then tip提示内容 邮箱格式错误

  @email
  Scenario: 修改电子邮箱-正确邮箱
    Given 导航到个人信息页面
    When 点击 电子邮箱 DIV按钮
    And 输入信息 taoyang987@gmail.com
    Then 校验电子邮箱

  @email
  Scenario: 修改电子邮箱-中英文混合
    Given 导航到个人信息页面
    When 点击 电子邮箱 DIV按钮
    And 输入信息 abc123邮箱
    Then tip提示内容 邮箱格式错误