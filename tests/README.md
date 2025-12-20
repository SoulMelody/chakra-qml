# Chakra QML 测试套件

本目录包含 Chakra QML 组件库的测试文件。

## 目录结构

```
tests/
├── qml/                    # QML 组件测试
│   ├── tst_CButton.qml
│   ├── tst_CInput.qml
│   └── tst_CCheckbox.qml
├── python/                 # Python 模块测试
│   └── test_frameless.py
├── run_qml_tests.py       # QML 测试运行器
├── run_python_tests.py    # Python 测试运行器
└── README.md
```

## 运行测试

### 运行 QML 组件测试

```bash
# 使用 Python 直接运行
python tests/run_qml_tests.py

# 或使用 uv
uv run tests/run_qml_tests.py
```

### 运行 Python 单元测试

```bash
# 使用 Python 直接运行
python tests/run_python_tests.py

# 或使用 uv
uv run tests/run_python_tests.py

# 或使用 unittest
python -m unittest discover tests/python -v
```

### 运行所有测试

```bash
# Windows PowerShell
python tests/run_qml_tests.py; python tests/run_python_tests.py

# Linux/macOS
python tests/run_qml_tests.py && python tests/run_python_tests.py
```

## QML 测试编写指南

QML 测试使用 Qt Test 框架。每个测试文件应该：

1. 导入必要的模块：
```qml
import QtQuick
import QtTest
import "../../src/components"
```

2. 继承自 TestCase：
```qml
TestCase {
    id: testCase
    name: "Component Tests"
    width: 400
    height: 400
    when: windowShown
}
```

3. 测试函数以 `test_` 开头：
```qml
function test_default_properties() {
    var component = createTemporaryObject(componentDef, testCase)
    verify(component !== null)
    compare(component.property, expectedValue)
}
```

### 常用断言方法

- `verify(condition, message)` - 验证条件为真
- `compare(actual, expected, message)` - 比较两个值
- `fuzzyCompare(actual, expected, delta, message)` - 浮点数比较
- `fail(message)` - 标记测试失败
- `skip(message)` - 跳过测试

### 常用工具方法

- `createTemporaryObject(component, parent, properties)` - 创建临时对象
- `mouseClick(item, x, y, button, modifiers, delay)` - 模拟鼠标点击
- `keyClick(key, modifiers, delay)` - 模拟键盘按键

## Python 测试编写指南

Python 测试使用标准的 unittest 框架：

```python
import unittest
from src.components.CFrameless import CFrameless

class TestCFrameless(unittest.TestCase):
    def setUp(self):
        self.instance = CFrameless()
    
    def test_something(self):
        self.assertIsNotNone(self.instance)
        self.assertEqual(self.instance.property, expected_value)
```

## 测试覆盖的组件

### 已测试组件
- [x] CButton
- [x] CInput
- [x] CCheckbox
- [x] CFrameless (Python)

### 待添加测试
- [ ] CSwitch
- [ ] CSelect
- [ ] CCard
- [ ] CAlert
- [ ] CDialog
- [ ] CDrawer
- [ ] CMenu
- [ ] CPagination
- [ ] CProgress
- [ ] CSpinner
- [ ] CBadge
- [ ] CTag
- [ ] CTooltip
- [ ] CScrollBar
- [ ] CScrollArea
- [ ] CSegmentedControl
- [ ] CWindow
- [ ] 其他组件...

## 持续集成

TODO: 添加 GitHub Actions 或其他 CI/CD 工作流

示例 GitHub Actions 配置：

```yaml
name: Tests

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-python@v4
        with:
          python-version: '3.10'
      - name: Install dependencies
        run: |
          pip install -e .
          pip install pytest
      - name: Run QML tests
        run: python tests/run_qml_tests.py
      - name: Run Python tests
        run: python tests/run_python_tests.py
```

## 贡献指南

添加新组件时，请同时添加对应的测试文件：

1. 在 `tests/qml/` 创建 `tst_ComponentName.qml`
2. 测试至少应包括：
   - 默认属性验证
   - 各种变体/尺寸
   - 交互功能
   - 状态变化
3. 确保所有测试通过后再提交

## 注意事项

- QML 测试需要图形环境支持（X11/Wayland/Windows）
- 在 CI 环境中可能需要虚拟显示（如 xvfb）
- 部分 Windows 特定功能在其他平台上可能无法完全测试
