# Chakra UI QML 演示

这个目录包含了 Chakra UI QML 组件库的完整演示示例。

## 文件说明

- `components-demo.qml` - 所有组件的完整演示（推荐）
- `demo.qml` - 简单的基础示例
- `button.qml` - 按钮组件演示
- `framless.qml` - 无边框窗口演示
- `run_demo.py` - 运行完整演示的 Python 脚本

## 运行演示

### 方式一：运行完整演示（推荐）

```bash
python demo/run_demo.py
```

这将启动一个包含所有组件的完整演示窗口，展示：

- **布局组件**: CFlex (space-between/around), CBox, CCenter
- **表单组件**: CButton (所有变体和尺寸), CInput, CCheckbox, CSwitch, CSelect
- **数据展示**: CBadge, CTag, CProgress, CSpinner
- **反馈组件**: CAlert (所有状态和变体)
- **导航组件**: CPagination, CSegmentedControl

### 方式二：运行单个示例

```bash
# 基础示例
python demo/main.py

# 按钮演示
# 修改 demo/main.py 中的 load 路径为 "demo/button.qml"
```

## 演示特性

### 主题切换
- 点击右上角的主题切换按钮
- 实时切换明亮/暗黑主题
- 所有组件自动适配主题

### 组件交互
- 所有组件都是可交互的
- 可以点击按钮、输入文本、切换开关等
- 实时查看组件状态变化

### 布局演示
完整演示了 `CFlex` 组件的新功能：
- `justify: "between"` - 元素之间平均分布
- `justify: "around"` - 元素周围平均分布
- `justify: "center"` - 元素居中
- `justify: "end"` - 元素靠右/底部对齐

### 窗口功能
- 无边框窗口设计
- Windows 原生 DWM 阴影
- 可拖动标题栏
- 最小化/最大化/关闭按钮

## 组件库使用说明

### 导入方式

```qml
import QtQuick
import "../src/components"  // 相对路径导入

// 或者在 Python 中注册后使用
import Chakra 1.0
```

### 基本使用

```qml
CWindow {
    width: 800
    height: 600
    
    CCard {
        title: "我的卡片"
        
        CButton {
            text: "点击我"
            colorScheme: "blue"
            onClicked: console.log("Clicked!")
        }
    }
}
```

### 布局示例

```qml
CFlex {
    direction: "row"
    justify: "between"  // space-between
    align: "center"
    gap: 16
    
    CButton { text: "左" }
    CButton { text: "中" }
    CButton { text: "右" }
}
```

## 注意事项

1. 确保已安装 PySide6: `pip install PySide6`
2. 确保编译了资源文件: `pyside6-rcc source/source.qrc -o source/source_rc.py`
3. 运行演示时会自动设置工作目录和导入路径

## 问题反馈

如果遇到问题，请检查：
- [ ] PySide6 是否正确安装
- [ ] 资源文件是否编译
- [ ] 是否在正确的目录下运行脚本

更多信息请查看主项目的 README.md 文件。
