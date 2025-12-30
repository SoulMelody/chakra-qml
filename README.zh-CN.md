# Chakra UI QML

受 [Chakra UI](https://chakra-ui.com/) 启发的现代化、易用的 QML 组件库。

[English](README.md) | 简体中文

## 特性

- 🎨 **29 个组件** - 按钮、输入框、卡片、菜单、对话框等
- 🌓 **深色模式** - 内置主题系统，支持亮色/暗色模式
- ⚡ **高性能** - 优化的渲染，最小化开销
- 🪟 **无边框窗口** - 原生 Windows DWM 阴影和自定义标题栏
- 🎯 **类型安全** - 完整的 PySide6 集成和类型提示
- 📱 **响应式** - 自适应布局和尺寸系统
- ♿ **可访问性** - 符合 ARIA 规范的组件（适用时）

## 安装

```bash
pip install chakra-qml
```

## 快速开始

### 基础用法

```python
import sys
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtQuickControls2 import QQuickStyle
from chakra import init

QQuickStyle.setStyle("Basic")
app = QGuiApplication(sys.argv)
engine = QQmlApplicationEngine()
init(engine)  # 注册 Chakra 组件
engine.load("main.qml")
sys.exit(app.exec())
```

### QML 示例

```qml
import QtQuick
import Chakra

CWindow {
    width: 800
    height: 600
    title: "我的应用"
    
    Column {
        spacing: 16
        anchors.centerIn: parent
        
        CButton {
            text: "点击我"
            colorScheme: "blue"
            onClicked: console.log("已点击！")
        }
        
        CInput {
            placeholderText: "输入文本..."
            variant: "outline"
        }
        
        CCard {
            title: "欢迎"
            description: "这是一个 Chakra UI 组件"
            width: 300
        }
    }
}
```

## 可用组件

### 布局
- `CBox` - 灵活的容器，支持样式属性
- `CFlex` - Flexbox 布局容器
- `CCenter` - 居中对齐容器
- `CContainer` - 响应式容器，带最大宽度

### 表单
- `CButton` - 多功能按钮，支持多种变体和尺寸
- `CInput` - 文本输入框，支持验证状态
- `CCheckbox` - 复选框，支持不确定状态
- `CSwitch` - 开关切换，带标签
- `CSelect` - 下拉选择框，支持搜索

### 数据展示
- `CCard` - 内容卡片，带页眉/页脚
- `CBadge` - 小型状态指示器
- `CTag` - 可移除的标签组件
- `CProgress` - 进度条，支持多种变体
- `CSpinner` - 加载动画

### 反馈
- `CAlert` - 警告消息，支持状态
- `CTooltip` - 悬停提示

### 覆盖层
- `CDialog` - 模态对话框
- `CDrawer` - 侧边抽屉/面板
- `CMenu` - 下拉菜单
- `CMenuItem` - 菜单项组件

### 导航
- `CPagination` - 分页控件
- `CSegmentedControl` - 分段选择器

### 其他
- `CWindow` - 无边框窗口，带原生阴影
- `CIcon` - 图标组件，100+ 图标
- `CScrollBar` - 自定义滚动条
- `CScrollArea` - 可滚动区域
- `CActionBar` - 浮动操作栏

## 主题自定义

库使用集中式的 `AppStyle` 单例进行主题管理：

```qml
// 切换主题
AppStyle.toggleTheme()

// 检查当前主题
if (AppStyle.isDark) {
    // 深色模式
}

// 访问主题颜色
color: AppStyle.primaryColor
color: AppStyle.textColor
color: AppStyle.backgroundColor
```

## 组件属性

### CButton

```qml
CButton {
    text: "按钮"
    variant: "solid"        // solid, outline, ghost, link
    colorScheme: "blue"     // blue, green, red, purple 等
    size: "md"              // sm, md, lg
    leftIcon: "check"
    rightIcon: "arrow-right"
    isLoading: false
    fullWidth: false
}
```

### CInput

```qml
CInput {
    placeholderText: "输入文本"
    variant: "outline"      // outline, filled, flushed
    size: "md"              // sm, md, lg
    isInvalid: false
    isDisabled: false
    isClearable: true
    type: "text"            // text, password
}
```

### CCard

```qml
CCard {
    title: "卡片标题"
    description: "卡片描述"
    variant: "elevated"     // elevated, outline, filled, subtle
    size: "md"              // sm, md, lg
    
    // 自定义内容
    CButton { text: "操作" }
}
```

## 无边框窗口

创建带原生 Windows 阴影的现代无边框窗口：

```qml
import Chakra

CWindow {
    width: 1280
    height: 800
    title: "我的应用"
    
    showTitleBar: true
    showThemeToggle: true
    showMinimize: true
    showMaximize: true
    showClose: true
    shadowEnabled: true     // Windows 上的原生 DWM 阴影
    
    // 你的内容在这里
}
```

## 性能优化

本库针对性能进行了优化：

- ✅ 避免不必要的 `layer.effect` 使用
- ✅ 高效的属性绑定
- ✅ `AppStyle` 中缓存的颜色映射
- ✅ 无边框窗口使用原生 Windows API
- ✅ 最小化动画开销

## 示例

查看 `demo` 文件夹获取完整示例：

- 基础组件展示
- 表单验证
- 数据表格
- 仪表板布局
- 设置页面

## 系统要求

- Python >= 3.8
- PySide6 >= 6.5.0

## 测试

本库包含针对 QML 组件和 Python 模块的完整测试套件。

### 运行测试

```bash
# 运行 QML 组件测试
python tests/run_qml_tests.py

# 运行 Python 单元测试
python tests/run_python_tests.py
```

详细测试文档见 [tests/README.md](tests/README.md)。

## 开源协议

MIT License - 详见 [LICENSE](LICENSE) 文件

## 开发

### 从源码构建

```bash
# 安装依赖
uv sync --group dev

# 构建 QML 模块（自动生成 qmldir）
uv run build-chakra

# 打包发布
uv build

# 本地安装测试
uv add dist/chakra_qml-*.whl
```

`build-chakra` 命令会自动：
- 扫描 `src/Chakra/` 中的所有 `.qml` 文件
- 检测单例组件（包含 `pragma Singleton` 的文件）
- 生成 `qmldir` 模块定义文件

## 贡献

欢迎贡献！请随时提交 Pull Request。

## 致谢

灵感来自 Segun Adebayo 的 [Chakra UI](https://chakra-ui.com/)。
