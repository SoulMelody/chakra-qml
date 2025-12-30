# CHoverCard 组件

悬停卡片组件，当鼠标悬停在触发器上时显示丰富的内容卡片。适合用于显示用户信息、预览内容等补充信息。

## 示例

```qml
import Chakra

CHoverCard {
    trigger: Text {
        text: "@chakra_ui"
        color: AppStyle.primaryColor
    }

    Column {
        spacing: 8
        Text { text: "Chakra UI"; font.bold: true }
        Text { text: "现代化的 QML 组件库" }
    }
}
```

## 属性

| 属性名 | 类型 | 默认值 | 描述 |
|--------|------|--------|------|
| delay | int | 600 | 打开延迟（毫秒），与 CTooltip 一致 |
| closeDelay | int | 300 | 关闭延迟（毫秒） |
| placement | string | "bottom" | 位置，可选 "top" / "bottom" / "left" / "right" |
| hasArrow | bool | true | 是否有箭头 |
| disabled | bool | false | 是否禁用 |
| isOpen | bool | - | 是否打开（只读） |
| trigger | Component | null | 触发器内容 |
| content | alias | - | 卡片内容（default 属性） |

## 信号

| 信号名 | 描述 |
|--------|------|
| opened | 打开时触发 |
| closed | 关闭时触发 |

## 示例代码

### 用户信息卡片

```qml
CHoverCard {
    trigger: Row {
        spacing: 8
        Rectangle {
            width: 32; height: 32
            radius: 16
            color: AppStyle.primaryColor
            Text {
                anchors.centerIn: parent
                text: "U"
                color: "white"
            }
        }
        Text { text: "用户名"; color: AppStyle.primaryColor }
    }

    Column {
        spacing: 12
        width: 280

        Row {
            spacing: 12
            Rectangle {
                width: 48; height: 48
                radius: 24
                color: AppStyle.primaryColor
            }
            Column {
                spacing: 4
                Text { text: "用户名"; font.bold: true; font.pixelSize: 16 }
                Text { text: "@username"; color: AppStyle.textSecondary }
            }
        }

        Text {
            text: "这是用户的个人简介，可以包含更多详细信息。"
            wrapMode: Text.WordWrap
            width: parent.width
        }

        Row {
            spacing: 16
            Text { text: "128 关注"; color: AppStyle.textSecondary }
            Text { text: "1.2k 粉丝"; color: AppStyle.textSecondary }
        }
    }
}
```

### 不同位置

```qml
Row {
    spacing: 20

    CHoverCard {
        placement: "top"
        trigger: CButton { text: "上方" }
        Text { text: "显示在上方" }
    }

    CHoverCard {
        placement: "bottom"
        trigger: CButton { text: "下方" }
        Text { text: "显示在下方" }
    }

    CHoverCard {
        placement: "left"
        trigger: CButton { text: "左侧" }
        Text { text: "显示在左侧" }
    }

    CHoverCard {
        placement: "right"
        trigger: CButton { text: "右侧" }
        Text { text: "显示在右侧" }
    }
}
```

### 自定义延迟

```qml
CHoverCard {
    delay: 200       // 更快打开
    closeDelay: 500  // 更慢关闭

    trigger: Text { text: "快速响应" }
    Text { text: "自定义延迟时间" }
}
```

### 无箭头

```qml
CHoverCard {
    hasArrow: false

    trigger: Text { text: "悬停我" }
    Text { text: "没有箭头的卡片" }
}
```

### 禁用状态

```qml
CHoverCard {
    disabled: true

    trigger: Text { text: "禁用的触发器"; color: AppStyle.textMuted }
    Text { text: "不会显示" }
}
```

## 注意事项

1. **可访问性**：HoverCard 仅用于补充信息，不应包含关键内容。屏幕阅读器无法访问，也无法通过键盘激活。

2. **延迟设置**：默认 delay 为 600ms，closeDelay 为 300ms，可根据需要调整以优化用户体验。

3. **内容区域**：卡片内容会自动计算尺寸，建议设置固定宽度以获得更好的布局效果。

4. **与 CTooltip 的区别**：
   - CTooltip 用于简短的文本提示
   - CHoverCard 用于丰富的内容展示（图片、多行文本、按钮等）

5. **鼠标交互**：鼠标移入卡片内容区域时会保持显示，移出后才会触发关闭延迟。
