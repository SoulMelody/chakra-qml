import QtQuick
import Chakra

CCard {
    id: root
    width: parent.width - AppStyle.spacing6 * 2
    variant: "outline"

    Column {
        width: parent.width
        spacing: AppStyle.spacing4
        padding: AppStyle.spacing6

        Text {
            text: "HoverCard 悬停卡片"
            font.pixelSize: AppStyle.fontSize2xl
            font.weight: Font.Bold
            color: AppStyle.textColor
        }

        Text {
            text: "悬停在元素上显示丰富的内容卡片，适合用于用户信息、预览内容等场景"
            font.pixelSize: AppStyle.fontSizeSm
            color: AppStyle.textSecondary
        }

        // 基础示例
        Text {
            text: "基础用法"
            font.pixelSize: AppStyle.fontSizeMd
            font.weight: Font.Medium
            color: AppStyle.textColor
            topPadding: AppStyle.spacing2
        }

        Row {
            spacing: AppStyle.spacing6

            CHoverCard {
                trigger: Text {
                    text: "@chakra_ui"
                    color: AppStyle.primaryColor
                    font.underline: true

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        acceptedButtons: Qt.NoButton
                    }
                }

                Column {
                    spacing: 8
                    width: 200

                    Text {
                        text: "Chakra UI"
                        font.pixelSize: AppStyle.fontSizeLg
                        font.weight: Font.Bold
                        color: AppStyle.textColor
                    }

                    Text {
                        text: "现代化的 QML 组件库"
                        font.pixelSize: AppStyle.fontSizeSm
                        color: AppStyle.textSecondary
                        wrapMode: Text.WordWrap
                        width: parent.width
                    }
                }
            }

            CHoverCard {
                trigger: CBadge {
                    text: "悬停查看"
                    colorScheme: "blue"
                }

                Column {
                    spacing: 8
                    width: 180

                    Text {
                        text: "这是一个徽章"
                        font.weight: Font.Medium
                        color: AppStyle.textColor
                    }

                    Text {
                        text: "悬停可以显示更多信息"
                        font.pixelSize: AppStyle.fontSizeSm
                        color: AppStyle.textSecondary
                        wrapMode: Text.WordWrap
                        width: parent.width
                    }
                }
            }
        }

        // 用户信息卡片
        Text {
            text: "用户信息卡片"
            font.pixelSize: AppStyle.fontSizeMd
            font.weight: Font.Medium
            color: AppStyle.textColor
            topPadding: AppStyle.spacing4
        }

        CHoverCard {
            placement: "right"

            trigger: Row {
                spacing: 8

                Rectangle {
                    width: 36
                    height: 36
                    radius: 18
                    color: AppStyle.primaryColor

                    Text {
                        anchors.centerIn: parent
                        text: "A"
                        color: "white"
                        font.weight: Font.Bold
                    }
                }

                Column {
                    anchors.verticalCenter: parent.verticalCenter

                    Text {
                        text: "ASLant"
                        color: AppStyle.textColor
                        font.weight: Font.Medium
                    }

                    Text {
                        text: "@aslant"
                        color: AppStyle.textSecondary
                        font.pixelSize: AppStyle.fontSizeSm
                    }
                }
            }

            Column {
                spacing: 12
                width: 260

                Row {
                    spacing: 12

                    Rectangle {
                        width: 56
                        height: 56
                        radius: 28
                        color: AppStyle.primaryColor

                        Text {
                            anchors.centerIn: parent
                            text: "A"
                            color: "white"
                            font.pixelSize: 24
                            font.weight: Font.Bold
                        }
                    }

                    Column {
                        spacing: 4
                        anchors.verticalCenter: parent.verticalCenter

                        Text {
                            text: "ASLant"
                            font.pixelSize: AppStyle.fontSizeLg
                            font.weight: Font.Bold
                            color: AppStyle.textColor
                        }

                        Text {
                            text: "@aslant"
                            font.pixelSize: AppStyle.fontSizeSm
                            color: AppStyle.textSecondary
                        }
                    }
                }

                Text {
                    text: "Chakra QML 组件库作者，热爱开源和 Qt/QML 开发。"
                    font.pixelSize: AppStyle.fontSizeSm
                    color: AppStyle.textColor
                    wrapMode: Text.WordWrap
                    width: parent.width
                }

                Row {
                    spacing: 16

                    Text {
                        text: "128 关注"
                        font.pixelSize: AppStyle.fontSizeSm
                        color: AppStyle.textSecondary
                    }

                    Text {
                        text: "1.2k 粉丝"
                        font.pixelSize: AppStyle.fontSizeSm
                        color: AppStyle.textSecondary
                    }
                }

                CButton {
                    text: "关注"
                    size: "sm"
                    width: parent.width
                }
            }
        }

        // 不同位置
        Text {
            text: "不同位置"
            font.pixelSize: AppStyle.fontSizeMd
            font.weight: Font.Medium
            color: AppStyle.textColor
            topPadding: AppStyle.spacing4
        }

        Row {
            spacing: AppStyle.spacing4

            CHoverCard {
                placement: "top"

                trigger: CButton {
                    text: "上方"
                    variant: "outline"
                }

                Text {
                    text: "显示在上方"
                    color: AppStyle.textColor
                }
            }

            CHoverCard {
                placement: "bottom"

                trigger: CButton {
                    text: "下方"
                    variant: "outline"
                }

                Text {
                    text: "显示在下方"
                    color: AppStyle.textColor
                }
            }

            CHoverCard {
                placement: "left"

                trigger: CButton {
                    text: "左侧"
                    variant: "outline"
                }

                Text {
                    text: "显示在左侧"
                    color: AppStyle.textColor
                }
            }

            CHoverCard {
                placement: "right"

                trigger: CButton {
                    text: "右侧"
                    variant: "outline"
                }

                Text {
                    text: "显示在右侧"
                    color: AppStyle.textColor
                }
            }
        }

        // 自定义延迟
        Text {
            text: "自定义延迟"
            font.pixelSize: AppStyle.fontSizeMd
            font.weight: Font.Medium
            color: AppStyle.textColor
            topPadding: AppStyle.spacing4
        }

        Row {
            spacing: AppStyle.spacing4

            CHoverCard {
                delay: 200
                closeDelay: 100

                trigger: CButton {
                    text: "快速响应"
                    colorScheme: "success"
                }

                Column {
                    spacing: 4
                    Text {
                        text: "快速响应"
                        font.weight: Font.Medium
                        color: AppStyle.textColor
                    }
                    Text {
                        text: "delay: 200ms, closeDelay: 100ms"
                        font.pixelSize: AppStyle.fontSizeSm
                        color: AppStyle.textSecondary
                    }
                }
            }

            CHoverCard {
                delay: 1000
                closeDelay: 500

                trigger: CButton {
                    text: "慢速响应"
                    colorScheme: "warning"
                }

                Column {
                    spacing: 4
                    Text {
                        text: "慢速响应"
                        font.weight: Font.Medium
                        color: AppStyle.textColor
                    }
                    Text {
                        text: "delay: 1000ms, closeDelay: 500ms"
                        font.pixelSize: AppStyle.fontSizeSm
                        color: AppStyle.textSecondary
                    }
                }
            }
        }

        // 无箭头 & 禁用
        Text {
            text: "其他选项"
            font.pixelSize: AppStyle.fontSizeMd
            font.weight: Font.Medium
            color: AppStyle.textColor
            topPadding: AppStyle.spacing4
        }

        Row {
            spacing: AppStyle.spacing4

            CHoverCard {
                hasArrow: false

                trigger: CButton {
                    text: "无箭头"
                    variant: "ghost"
                }

                Text {
                    text: "没有箭头的卡片"
                    color: AppStyle.textColor
                }
            }

            CHoverCard {
                disabled: true

                trigger: CButton {
                    text: "已禁用"
                    variant: "ghost"
                    enabled: false
                }

                Text {
                    text: "不会显示"
                    color: AppStyle.textColor
                }
            }
        }
    }
}
